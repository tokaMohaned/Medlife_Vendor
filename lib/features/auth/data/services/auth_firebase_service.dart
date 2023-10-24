import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medlife_v2/features/auth/data/models/login_data.dart';
import 'package:medlife_v2/features/auth/data/models/register_data.dart';
import 'package:medlife_v2/utils/constants.dart';
import 'package:medlife_v2/utils/data/models/vendor.dart';

class AuthFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.vendors);

  Future<Vendor> register(RegisterData registerModel) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerModel.email,
      password: registerModel.password,
    );
    await userCredential.user?.sendEmailVerification();
    final uId = userCredential.user!.uid;
    final userModel = Vendor(
      id: uId,
      firstName: registerModel.firstName,
      lastName: registerModel.lastName,
      email: registerModel.email,
    );
    await _usersCollection.doc(uId).set(userModel.toJson());
    return userModel;
  }

  Future<Vendor> login(LoginData loginData) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.email,
      password: loginData.password,
    );
    if (userCredential.user!.emailVerified) {
      final uId = userCredential.user!.uid;
      final docSnapShot = await _usersCollection.doc(uId).get();
      final userModel = Vendor.fromJson(docSnapShot.data()!);
      return userModel;
    } else {
      throw Exception("Email not verified");
    }
  }

  Future<void> logout() => FirebaseAuth.instance.signOut();

  Future<void> requestPasswordReset(String email) =>
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  bool getAuthStatus() => FirebaseAuth.instance.currentUser != null;
}
