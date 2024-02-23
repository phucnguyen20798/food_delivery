import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/data/providers/food_delivery_api.dart';
import 'package:food_delivery/data/repositories/food_delivery_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> setUp() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    FoodDeliveryAPI foodDeliveryAPI = FoodDeliveryAPI();
    FoodDeliveryRepository repository = FoodDeliveryRepository(foodDeliveryAPI);
    getIt.registerSingleton<FoodDeliveryRepository>(repository);
  }
}
