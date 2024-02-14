import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/auth_bloc.dart';
import 'package:food_delivery/business_logic/events/auth_event.dart';
import 'package:food_delivery/business_logic/states/auth_state.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/components/change_language.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is ChangeLanguageState) {
        EasyLocalization.of(context)?.setLocale(state.locale);
        final prefs = getIt.get<SharedPreferences>();
        prefs.setString(
            'language', TextUtils.getLanguageFromLocale(state.locale));
      }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Food Delivery'.toUpperCase(),
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            ChangeLanguage(onClick: (locale) {
              context.read<AuthBloc>().add(ChangeLanguageEvent(locale));
            })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) => const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Phục vụ 24/24 cho mọi khách hàng'),
                          ],
                        )),
              ),
              SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 3,
                  effect: SlideEffect(
                    dotColor: Colors.grey.shade300,
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: Colors.green.shade700,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
              const SizedBox(height: 24.0),
              GeneralButton(
                  content: 'sign_in'.tr(),
                  backgroundColor: Colors.green.shade700,
                  textColor: Colors.white,
                  onClick: () {
                    Navigator.pushNamed(context, '/sign_in');
                  }),
              const SizedBox(height: 12.0),
              GeneralButton(
                  content: 'sign_up'.tr(),
                  backgroundColor: Colors.white,
                  textColor: Colors.green.shade700,
                  isOutlineBorder: true,
                  onClick: () {
                    Navigator.pushNamed(context, '/sign_up');
                  }),
              const SizedBox(height: 16.0),
              RichText(
                  text: TextSpan(
                      text: 'footer.auth'.tr(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: [
                    TextSpan(
                        text: 'term_of_service.auth'.tr(),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.teal,
                        )),
                    TextSpan(
                        text: 'and.auth'.tr(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: 'privacy_policy.auth'.tr(),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.teal,
                        ))
                  ])),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    });
  }
}
