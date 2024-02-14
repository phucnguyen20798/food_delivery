import 'package:flutter/material.dart';

class TextUtils {
  static String getLanguageCode(String input) {
    switch (input) {
      case 'Tiếng Việt':
        return 'vi';
      case 'Indonesia':
        return 'id';
      case 'English':
        return 'en';
      default:
        return 'en';
    }
  }

  static String getCountryCode(String input) {
    switch (input) {
      case 'Tiếng Việt':
        return 'VN';
      case 'Indonesia':
        return 'ID';
      case 'English':
        return 'US';
      default:
        return 'US';
    }
  }

  static String getLanguageFromLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'vi':
        return 'Tiếng Việt';
      case 'id':
        return 'Indonesia';
      case 'en':
        return 'English';
      default:
        return 'Tiếng Việt';
    }
  }
}
