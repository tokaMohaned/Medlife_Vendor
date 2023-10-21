import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medlife_v2/utils/constants.dart';
import 'package:medlife_v2/utils/data/models/vendor.dart';

class ProfileFirebaseService {
  final _vendorCollection =
      FirebaseFirestore.instance.collection(FirebasePath.vendors);

  Future<Vendor> getVendor() async {
    final currentVendorId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await _vendorCollection.doc(currentVendorId).get();
    return Vendor.fromJson(docSnapshot.data()!);
  }

  Future<void> updateVendor(Vendor updatedVendor) async {
    final currentVendorId = FirebaseAuth.instance.currentUser!.uid;
    final vendorDoc = _vendorCollection.doc(currentVendorId);
    final updatedVendorData = updatedVendor.toJson();
    await vendorDoc.update(updatedVendorData);
  }
}
