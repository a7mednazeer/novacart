part of 'order_history_cubit.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object?> get props => [];
}

class OrderHistoryLoading extends OrderHistoryState {
  const OrderHistoryLoading();
}

class OrderHistoryLoaded extends OrderHistoryState {
  const OrderHistoryLoaded(this.orders);
  final List<OrderEntity> orders;

  @override
  List<Object?> get props => [orders];
}

class OrderHistoryError extends OrderHistoryState {
  const OrderHistoryError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
