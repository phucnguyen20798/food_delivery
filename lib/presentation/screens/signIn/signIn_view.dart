import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/signIn_bloc.dart';
import 'package:food_delivery/business_logic/events/signIn_event.dart';
import 'package:food_delivery/business_logic/states/signIn_state.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:food_delivery/presentation/utils/app_utils.dart';
import 'package:food_delivery/presentation/widgets/components/change_language.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';

TextEditingController phoneNumberController = TextEditingController();
String? language, message;

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is ChangeLanguageState) {
          EasyLocalization.of(context)?.setLocale(state.locale);
          AppUtils.saveLanguage(state.locale);
          language = AppUtils.getLanguage();
          log('Language Sign In: $language');
        } else if (state is ValidatePhoneNumberFailureState) {
          message = state.message;
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, language);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.help,
                  color: Colors.black,
                ),
              ),
              ChangeLanguage(
                onClick: (locale) {
                  context.read<SignInBloc>().add(ChangeLanguageEvent(locale));
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12.0),
                Text(
                  'signInTitle'.tr(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'signInDesc'.tr(),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'phoneNumber.label'.tr(),
                    hintText: 'phoneNumber.hint'.tr(),
                    errorText: message,
                    prefixIcon: const Icon(Icons.phone),
                    suffixIcon: InkWell(
                      onTap: () {
                        phoneNumberController.clear();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                GeneralButton(
                    content: 'continue'.tr(),
                    backgroundColor: Colors.green.shade700,
                    textColor: Colors.white,
                    onClick: () {
                      context.read<SignInBloc>().add(
                          ValidatePhoneNumberEvent(phoneNumberController.text));
                    }),
                const SizedBox(height: 12.0),
                RichText(
                    text: TextSpan(
                        text: 'footer.signIn'.tr(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                          text: 'term_of_service.signIn'.tr(),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                          )),
                      TextSpan(
                          text: 'and.signIn'.tr(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: 'privacy_policy.signIn'.tr(),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                          ))
                    ])),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, SignInState state) {
        if (state is ValidatePhoneNumberState) {
          Navigator.pushNamed(context, AppConstant.verifyOTP,
              arguments: phoneNumberController.text);
        }
      },
    );
  }
}
