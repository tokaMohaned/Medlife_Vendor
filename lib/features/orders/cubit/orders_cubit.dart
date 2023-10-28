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
}
