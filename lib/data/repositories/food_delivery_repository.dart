import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/data/models/account.dart';
import 'package:food_delivery/data/models/food.dart';
import 'package:food_delivery/data/providers/food_delivery_api.dart';

import '../models/vote_restaurant.dart';

class FoodDeliveryRepository {
  final FoodDeliveryAPI _foodDeliveryAPI;

  FoodDeliveryRepository(this._foodDeliveryAPI);

  Future<void> verifyPhoneNumberWithOTP({
    required String phone,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(String) onFailure,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    _foodDeliveryAPI.verifyPhone(
        phone: phone,
        verificationCompleted: verificationCompleted,
        onFailure: onFailure,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<void> createAccount(String id, String phone, String fullName, int sex,
      DateTime birthDay) async {
    Account account = Account(id, phone, fullName, sex, birthDay);
    _foodDeliveryAPI.insertAccountToDB(account);
  }

  Future<void> deleteAccount(String id) async {
    _foodDeliveryAPI.deleteAccountToDB(id);
  }

  Future<Account> getAccountByID(String id) async {
    return await _foodDeliveryAPI.getAccountFromDB(id);
  }

  Future<void> updateAccountInfo(
      String id, Map<String, dynamic> dataInfo) async {
    _foodDeliveryAPI.updateAccountToDB(id, dataInfo);
  }

  Future<List<Food>> getBestFavoriteFood() async {
    final result = await _foodDeliveryAPI.getBestFavoriteFoodInRestaurant();
    return result;
  }

  Future<List<VoteRestaurant>> getBestVoteRestaurants() async {
    final result = await _foodDeliveryAPI.getBestVoteRestaurants();
    return result;
  }
  
}
