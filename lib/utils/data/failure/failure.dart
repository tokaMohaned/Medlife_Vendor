import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Failure {
  final String message;

  const Failure(this.message);

  factory Failure.fromException(dynamic e) {
    if (e is FirebaseAuthException) {
      return _handleFirebaseAuthException(e);
    } else {
      debugPrint(e.toString());
      return const Failure('Something went wrong');
    }
  }
}

Failure _handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return const Failure('User not found');
    case 'wrong-password':
      return const Failure('Wrong password or Email');
    case 'email-already-in-use':
      return const Failure('Email is already in use');
    case 'invalid-email':
      return const Failure('Invalid email address');
    case 'weak-password':
      return const Failure('Password is too weak');
    default:
      return Failure('Firebase Auth error: ${e.message}');
  }
}
