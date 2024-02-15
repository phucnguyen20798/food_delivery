import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  String language = 'Tiếng Việt';

  @override
  void initState() {
    language = getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          width: baseWidth,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'change_language.title'.tr(),
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'change_language.subtitle'.tr(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24.0),
              RadioListTile(
                value: 'English',
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = 'English';
                  });
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: Colors.green.shade700,
                title: const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              RadioListTile(
                value: 'Indonesia',
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = 'Indonesia';
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                activeColor: Colors.green.shade700,
                title: const Text(
                  'Indonesia',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              RadioListTile<String>(
                value: 'Tiếng Việt',
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = 'Tiếng Việt';
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                activeColor: Colors.green.shade700,
                title: const Text(
                  'Tiếng Việt',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              GeneralButton(
                  content: '${'use'.tr()} $language',
                  backgroundColor: Colors.green.shade700,
                  textColor: Colors.white,
                  onClick: () {
                    Navigator.pop(context, language);
                  })
            ],
          ),
        ),
      ],
    );
  }

  String getLanguage() {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getString('language') ?? 'Tiếng Việt';
  }
}
