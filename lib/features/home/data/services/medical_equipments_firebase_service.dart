import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/utils/constants.dart';

import '../models/medical_equipment.dart';

class MedicalEquipmentsFirebaseService {

  static CollectionReference<MedicalEquipment> getMedicalEquipmentsCollection() {
    return FirebaseFirestore.instance
        .collection(FirebasePath.medicalEquipments)
        .withConverter<MedicalEquipment>(
      fromFirestore: (snapshot, _) => MedicalEquipment.fromJson(snapshot.data()!),
      toFirestore: (task, options) => task.toJson(),
    );
  }

   Future<void> addMedicalEquipment(MedicalEquipment equipment) {
    var medicalEquipments = getMedicalEquipmentsCollection();
    var docRef = medicalEquipments.doc();
    equipment.id = docRef.id;
    return docRef.set(equipment);
  }
}
