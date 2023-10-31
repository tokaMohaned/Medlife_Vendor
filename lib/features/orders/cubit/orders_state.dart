abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class GetOrdersLoading extends OrdersState {}

class GetOrdersSuccess extends OrdersState {}

class GetOrdersError extends OrdersState {
  final String message;

  GetOrdersError(this.message);
}

class AcceptOrderLoading extends OrdersState {}

class AcceptOrderSuccess extends OrdersState {}

class AcceptOrderError extends OrdersState {
  final String message;

  AcceptOrderError(this.message);
}

class DeclineOrderLoading extends OrdersState {}

class DeclineOrderSuccess extends OrdersState {}

class DeclineOrderError extends OrdersState {
  final String message;

  DeclineOrderError(this.message);
}

class GetPendingOrdersLoading extends OrdersState {}

class GetPendingOrdersSuccess extends OrdersState {}

class GetPendingOrdersError extends OrdersState {
  final String message;

  GetPendingOrdersError(this.message);
}

class GetAcceptOrderLoading extends OrdersState {}

class GetAcceptOrderSuccess extends OrdersState {}

class GetAcceptOrderError extends OrdersState {
  final String message;

  GetAcceptOrderError(this.message);
}

class GetDeliveredOrdersLoading extends OrdersState {}

class GetDeliveredOrdersSuccess extends OrdersState {}

class GetDeliveredOrdersError extends OrdersState {
  final String message;

  GetDeliveredOrdersError(this.message);
}
