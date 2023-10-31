import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/utils/constants.dart';

class OrdersFirebaseService {
  final _ordersCollection = FirebaseFirestore.instance
      .collection(FirebasePath.vendors)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.orders);

  Future<List<Order>> getOrders() async {
    final querySnapshot = await _ordersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
      (order, nextOrder) => nextOrder.dateTime.compareTo(order.dateTime),
    );
    return orders;
  }

  Future<void> acceptOrder(String orderId) async =>
      _ordersCollection.doc(orderId).update({
        FirebasePath.status: 'Accepted',
      });

  Future<void> declineOrder(String orderId) async =>
      _ordersCollection.doc(orderId).update({
        FirebasePath.status: 'Declined',
      });

  Future<void> orderDelivered(String orderId) async =>
      _ordersCollection.doc(orderId).update({
        FirebasePath.status: 'Delivered',
      });

}
