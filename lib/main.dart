import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/di.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DependencyInjection.setUp();
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
