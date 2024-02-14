import 'package:flutter/material.dart';

import '../widgets/bottomsheet/change_language_bottomsheet.dart';

class BottomSheetUtils {
  static void showChangeLanguageBottomSheet({
    required BuildContext context,
    required Function(String) onConfirm,
  }) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => const ChangeLanguageBottomSheet()).then((value) {
      if (value != null) {
        onConfirm(value);
      }
    });
  }
}
