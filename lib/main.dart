import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  runApp(EasyLocalization(
      path: 'assets/translations',
      startLocale: const Locale('vi', 'VN'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
        Locale('vi', 'VN'),
      ],
      fallbackLocale: const Locale('vi', 'VN'),
      child: const MyApp()));
}
