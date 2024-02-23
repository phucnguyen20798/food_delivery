import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextUtils {
  static String prefixPhoneNumberVN =
      '039, 038, 037, 036, 035, 034, 033, 032, 098, 097, 096, 086, 083, 084, 085, 081, 088, 082, 070, 079, 077, 076, 078, 052, 056, 058, 092, 090, 093, 089, 099, 059';

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

  static String formatMoney(double price) {
    NumberFormat formatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');
    return formatter.format(price);
  }

  static String? validatePhoneNumber(String phone) {
    if (phone.isEmpty) {
      return 'Số điện thoại không được để trống';
    } else if (phone.length != 10 && phone.length != 11) {
      return 'Số điện thoại không hợp lệ';
    } else {
      final String prefixPhoneCode = phone.substring(0, 3);
      log('Prefix: $prefixPhoneCode');
      final prefixPhoneNumberStr = prefixPhoneNumberVN.split(', ');
      if (!prefixPhoneNumberStr.contains(prefixPhoneCode)) {
        return 'Đầu số không tồn tại';
      }
    }
    return null;
  }

  static String getPhoneNumber(String phone) {
    return '+84${phone.substring(1)}';
  }
}
