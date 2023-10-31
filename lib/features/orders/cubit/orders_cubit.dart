import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/data/services/orders_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(BuildContext context) =>
      BlocProvider.of<OrdersCubit>(context);

  final ordersFirebaseService = OrdersFirebaseService();
  List<Order> orders = [];
  List<Order> pendingOrders = [];
  List<Order> acceptedOrders = [];
  List<Order> deliveredOrders = [];

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    try {

      orders = await ordersFirebaseService.getOrders();
      emit(GetOrdersSuccess());
    } catch (e) {
      emit(GetOrdersError(Failure.fromException(e).message));
    }
  }

  Future<void> acceptOrder(String orderId) async {
    emit(AcceptOrderLoading());
    try {
      await ordersFirebaseService.acceptOrder(orderId);
      emit(AcceptOrderSuccess());
    } catch (e) {
      emit(AcceptOrderError(Failure.fromException(e).message));
    }
  }

  Future<void> declineOrder(String orderId) async {
    emit(DeclineOrderLoading());
    try {
      await ordersFirebaseService.declineOrder(orderId);
      emit(DeclineOrderSuccess());
    } catch (e) {
      emit(DeclineOrderError(Failure.fromException(e).message));
    }
  }

  Future<void> orderDelivered (String orderId) async {
    emit(OrderDeliveredLoading());
    try {
      await ordersFirebaseService.orderDelivered(orderId);
      emit(OrderDeliveredSuccess());
    } catch (e) {
      emit(OrderDeliveredError(Failure.fromException(e).message));
    }
  }

  Future<void> getPendingOrders() async {
    emit(GetPendingOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      pendingOrders = orders
          .where((order) => order.status == 'Pending')
          .toList();

      emit(GetPendingOrdersSuccess());
    } catch (e) {
      emit(GetPendingOrdersError(Failure.fromException(e).message));
    }
  }

  Future<void> getAcceptedOrder() async {
    emit(GetAcceptOrderLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      acceptedOrders = orders
          .where((order) => order.status == 'Accepted')
          .toList();
      emit(GetAcceptOrderSuccess());
    } catch (e) {
      emit(GetAcceptOrderError(Failure.fromException(e).message));
    }
  }

  Future<void> getDeliveredOrders() async {
    emit(GetDeliveredOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      deliveredOrders = orders
          .where((order) => order.status == 'Delivered')
          .toList();

      emit(GetDeliveredOrdersSuccess());
    } catch (e) {
      emit(GetDeliveredOrdersError(Failure.fromException(e).message));
    }
  }
}
