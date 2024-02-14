import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FoodDeliveryAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInPhoneNumber(
    String phone,
    Function() onSuccess,
    Function(String?) onFailure,
  ) async {
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) async {
          log('LOG: Verification Completed');
        },
        verificationFailed: (exception) {
          log('LOG: Verification Failure');
          onFailure(exception.message);
        },
        codeSent: (verificationId, forceResendingToken) async {
          log('LOG: Code Sent');
        },
        codeAutoRetrievalTimeout: (value) {});
  }
}
