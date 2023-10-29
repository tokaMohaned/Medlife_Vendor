import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';

class CartMedicalEquipment {
  final MedicalEquipment medicalEquipment;
  final int quantity;

  const CartMedicalEquipment({
    required this.medicalEquipment,
    required this.quantity,
  });

  CartMedicalEquipment.fromJson(Map<String, dynamic> json)
      : this(
          medicalEquipment: MedicalEquipment.fromJson(
            json['medicalEquipment'] as Map<String, dynamic>,
          ),
          quantity: json['quantity'] as int,
        );
}
