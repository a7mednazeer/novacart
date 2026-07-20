import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../checkout/domain/entities/order_entity.dart';
import '../../../checkout/domain/repositories/order_repository.dart';

part 'order_details_state.dart';

/// Rather than adding a separate "get order by id" Firestore query,
/// this reuses the same `watchOrders` stream `OrderHistoryCubit` uses
/// and just filters to the one id — order lists are small per user, so
/// this avoids a second read pattern for what's fundamentally the same
/// data.
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this._repository, this._currentUser, this._orderId)
      : super(const OrderDetailsLoading());

  final OrderRepository _repository;
  final CurrentUserService _currentUser;
  final String _orderId;

  StreamSubscription<List<OrderEntity>>? _subscription;

  void load() {
    final uid = _currentUser.uid;
    if (uid == null) {
      emit(const OrderDetailsError('You need to be signed in to view this order.'));
      return;
    }

    _subscription?.cancel();
    _subscription = _repository.watchOrders(uid).listen(
      (orders) {
        for (final order in orders) {
          if (order.id == _orderId) {
            emit(OrderDetailsLoaded(order));
            return;
          }
        }
        emit(const OrderDetailsNotFound());
      },
      onError: (_) => emit(const OrderDetailsError('Could not load this order.')),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
