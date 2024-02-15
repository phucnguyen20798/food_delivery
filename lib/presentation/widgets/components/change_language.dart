import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/utils/app_utils.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';

import '../../utils/bottomsheet_utils.dart';

class ChangeLanguage extends StatefulWidget {
  final String? title;
  final Function(Locale) onClick;

  const ChangeLanguage({
    super.key,
    this.title,
    required this.onClick,
  });

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String language = 'Tiếng Việt';

  @override
  void initState() {
    language = AppUtils.getLanguage();
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
                widget.onClick(locale);
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

  @override
  void didUpdateWidget(covariant ChangeLanguage oldWidget) {
    if (oldWidget.title != widget.title && widget.title != null) {
      setState(() {
        log('Title: ${widget.title}');
        language = widget.title!;
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
