import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:food_delivery/data/models/account.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';

class FoodDeliveryAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.refFromURL(AppConstant.dbUrl);

  Future<void> verifyPhone({
    required String phone,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(String) onFailure,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (credential) {
            log('LOG: Verification Completed');
            verificationCompleted(credential);
          },
          verificationFailed: (exception) {
            log('LOG: Verification Failure');
            if (exception.code == 'invalid-phone-number') {
              onFailure('Số điện thoại được cung cấp không hợp lệ.');
            }
          },
          codeSent: (verificationId, forceResendingToken) {
            log('LOG: Code Sent');
            codeSent(verificationId, forceResendingToken);
          },
          codeAutoRetrievalTimeout: (value) {
            log('LOG: Code AutoRetrieval');
            codeAutoRetrievalTimeout(value);
          });
    } catch (exception) {
      if (kDebugMode) {
        onFailure('Số điện thoại được cung cấp không hợp lệ.');
      }
    }
  }

  Future<void> insertAccountToDB(Account account) async {
    _dbRef.child('accounts').child(account.id).set(account.toJson());
  }

  Future<void> updateAccountToDB(
      String idAccount, Map<String, Object?> value) async {
    _dbRef.child('accounts').child(idAccount).update(value);
  }

  Future<void> deleteAccountToDB(String idAccount) async {
    _dbRef.child('accounts').child(idAccount).remove();
  }

  Future<Account> getAccountFromDB(String idAccount) async {
    DataSnapshot dataSnapshot =
        await _dbRef.child('accounts').child(idAccount).get();
    final dataValue = jsonDecode(jsonEncode(dataSnapshot.value));
    return Account.fromJson(dataValue);
  }
}
