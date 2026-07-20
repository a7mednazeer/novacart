part of 'order_details_cubit.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object?> get props => [];
}

class OrderDetailsLoading extends OrderDetailsState {
  const OrderDetailsLoading();
}

class OrderDetailsLoaded extends OrderDetailsState {
  const OrderDetailsLoaded(this.order);
  final OrderEntity order;

  @override
  List<Object?> get props => [order];
}

class OrderDetailsNotFound extends OrderDetailsState {
  const OrderDetailsNotFound();
}

class OrderDetailsError extends OrderDetailsState {
  const OrderDetailsError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
