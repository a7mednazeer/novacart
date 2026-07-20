import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../checkout/domain/entities/order_entity.dart';
import '../../../checkout/domain/repositories/order_repository.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this._repository, this._currentUser)
      : super(const OrderHistoryLoading());

  final OrderRepository _repository;
  final CurrentUserService _currentUser;

  StreamSubscription<List<OrderEntity>>? _subscription;

  void loadOrders() {
    final uid = _currentUser.uid;
    if (uid == null) {
      emit(const OrderHistoryError('You need to be signed in to view orders.'));
      return;
    }

    _subscription?.cancel();
    _subscription = _repository.watchOrders(uid).listen(
          (orders) => emit(OrderHistoryLoaded(orders)),
          onError: (_) => emit(const OrderHistoryError(
            'Could not load your order history.',
          )),
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
