import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/bottomsheet_utils.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String language = 'Tiếng Việt';

  @override
  void initState() {
    language = getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomSheetUtils.showChangeLanguageBottomSheet(
            context: context,
            onConfirm: (chooseLanguage) {
              setState(() {
                language = chooseLanguage;
                String languageCode = TextUtils.getLanguageCode(chooseLanguage);
                String countryCode = TextUtils.getCountryCode(chooseLanguage);
                Locale locale = Locale(languageCode, countryCode);
                EasyLocalization.of(context)?.setLocale(locale);
                saveLanguage(locale);
              });
            });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, right: 12.0, left: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.translate,
              color: Colors.black,
              size: 16.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              language,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getLanguage() {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getString('language') ?? 'Tiếng Việt';
  }

  void saveLanguage(Locale locale) {
    final prefs = getIt.get<SharedPreferences>();
    prefs.setString('language', TextUtils.getLanguageFromLocale(locale));
  }
}
