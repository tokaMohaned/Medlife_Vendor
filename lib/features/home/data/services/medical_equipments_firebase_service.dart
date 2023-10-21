import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medlife_v2/utils/constants.dart';
import '../models/medical_equipment.dart';

class MedicalEquipmentsFirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  static CollectionReference<MedicalEquipment>
      getMedicalEquipmentsCollection() {
    return FirebaseFirestore.instance
        .collection(FirebasePath.medicalEquipments)
        .withConverter<MedicalEquipment>(
          fromFirestore: (snapshot, _) =>
              MedicalEquipment.fromJson(snapshot.data()!),
          toFirestore: (equipment, options) => equipment.toJson(),
        );
  }

  Future<void> addMedicalEquipment(
      MedicalEquipment equipment, List<File> imageFiles) async {
    var medicalEquipments = getMedicalEquipmentsCollection();
    final List<String> imageUrls = await uploadImages(imageFiles);
    equipment.imagesUrls.addAll(imageUrls);

    var docRef = medicalEquipments.doc();
    equipment.id = docRef.id;
    return docRef.set(equipment);
  }

  Future<List<String>> uploadImages(List<File> imageFiles) async {
    final Reference storageRef =
        _storage.ref().child("${FirebasePath.medicalEquipments}");
    final List<String> downloadUrls = [];

    for (File imageFile in imageFiles) {
      final UploadTask uploadTask =
          storageRef.child('${imageFile.hashCode}').putFile(imageFile);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }

    return downloadUrls;
  }
}
