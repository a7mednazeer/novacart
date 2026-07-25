import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/usecases/get_products_by_ids_usecase.dart';
import '../../domain/repositories/recently_viewed_repository.dart';
import '../../domain/usecases/record_product_view_usecase.dart';

part 'recently_viewed_state.dart';

/// App-wide singleton, same pattern as `WishlistCubit` — Product
/// Details records a view here, and Home reads the resulting list.
class RecentlyViewedCubit extends Cubit<RecentlyViewedState> {
  RecentlyViewedCubit(
    this._repository,
    this._recordViewUseCase,
    this._getProductsByIds,
    this._currentUser,
  ) : super(const RecentlyViewedState());

  final RecentlyViewedRepository _repository;
  final RecordProductViewUseCase _recordViewUseCase;
  final GetProductsByIdsUseCase _getProductsByIds;
  final CurrentUserService _currentUser;

  StreamSubscription<List<String>>? _subscription;
  String? _activeUid;

  void ensureStarted() {
    final uid = _currentUser.uid;
    if (uid == null || uid == _activeUid) return;

    _activeUid = uid;
    _subscription?.cancel();
    _subscription = _repository.watchRecentlyViewedIds(uid).listen((orderedIds) async {
      if (orderedIds.isEmpty) {
        emit(state.copyWith(products: [], isLoading: false));
        return;
      }

      final result = await _getProductsByIds(orderedIds.toSet());
      result.fold(
        (failure) => emit(state.copyWith(isLoading: false)),
        (products) {
          // `GetProductsByIdsUseCase` returns products in catalog order,
          // not recency order — re-sort to match `orderedIds` so "most
          // recently viewed" actually means something in the UI.
          final byId = {for (final p in products) p.id: p};
          final ordered = orderedIds
              .map((id) => byId[id])
              .whereType<ProductEntity>()
              .toList();
          emit(state.copyWith(products: ordered, isLoading: false));
        },
      );
    });
  }

  Future<void> recordView(String productId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _recordViewUseCase(uid, productId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
