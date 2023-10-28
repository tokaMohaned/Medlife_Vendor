import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/address.dart';

class Order {
  final String id;
  final String status;
  final DateTime dateTime;
  final OrderCost orderCost;
  final List<MedicalEquipment> medicalEquipments;
  final Address address;
  final String phone;
  final String paymentMethod;

  Order({
    required this.id,
    required this.status,
    required this.dateTime,
    required this.orderCost,
    required this.medicalEquipments,
    required this.address,
    required this.phone,
    required this.paymentMethod,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          status: json['status'] as String,
          dateTime: (json['dateTime'] as Timestamp).toDate(),
          orderCost:
              OrderCost.fromJson(json['orderCost'] as Map<String, dynamic>),
          medicalEquipments: (json['medicalEquipments'] as List)
              .map(
                (json) =>
                    MedicalEquipment.fromJson(json as Map<String, dynamic>),
              )
              .toList(),
          address: Address.fromJson(json['address'] as Map<String, dynamic>),
          phone: json['phone'] as String,
          paymentMethod: json['paymentMethod'] as String,
        );
}
