import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/utils/constants.dart';

class OrdersFirebaseService {
  final _vendorsOrdersCollection = FirebaseFirestore.instance
      .collection(FirebasePath.vendors)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.orders);

  final _usesOrdersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  Future<List<Order>> getVendorOrders() async {
    final querySnapshot = await _vendorsOrdersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
      (order, nextOrder) => nextOrder.dateTime.compareTo(order.dateTime),
    );
    return orders;
  }

  Future<List<Order>> getUserOrders() async {
    final querySnapshot = await _usesOrdersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
      (order, nextOrder) => nextOrder.dateTime.compareTo(order.dateTime),
    );
    return orders;
  }

  Future<void> acceptOrder(String orderId,String userId) async =>
      _vendorsOrdersCollection.doc(orderId).update({
        FirebasePath.status: 'Accepted',
      }).then(
        (value) => _usesOrdersCollection
            .doc(userId)
            .collection(FirebasePath.orders)
            .doc(orderId)
            .update({
          FirebasePath.status: 'Accepted',
        }),
      );

  Future<void> declineOrder(String orderId,String userId) async =>
      _vendorsOrdersCollection.doc(orderId).update({
        FirebasePath.status: 'Declined',
      }).then(
        (value) => _usesOrdersCollection
            .doc(userId)
            .collection(FirebasePath.orders)
            .doc(orderId)
            .update({
          FirebasePath.status: 'Declined',
        }),
      );

  Future<void> orderDelivered(String orderId,String userId) async =>
      _vendorsOrdersCollection.doc(orderId).update({
        FirebasePath.status: 'Delivered',
      }).then(
        (value) => _usesOrdersCollection
            .doc(userId)
            .collection(FirebasePath.orders)
            .doc(orderId)
            .update({
          FirebasePath.status: 'Delivered',
        }),
      );
}
