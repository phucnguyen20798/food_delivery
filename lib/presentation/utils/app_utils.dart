import 'package:flutter/material.dart';
import 'package:food_delivery/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'text_utils.dart';

class AppUtils {
  static void saveLanguage(Locale locale) {
    final prefs = getIt.get<SharedPreferences>();
    prefs.setString('language', TextUtils.getLanguageFromLocale(locale));
  }

  static String getLanguage() {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getString('language') ?? 'Tiếng Việt';
  }
}
