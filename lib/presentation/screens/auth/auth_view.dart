import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/auth_bloc.dart';
import 'package:food_delivery/business_logic/events/auth_event.dart';
import 'package:food_delivery/business_logic/states/auth_state.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:food_delivery/presentation/utils/app_utils.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/slide.dart';
import '../../widgets/components/change_language.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  PageController pageController = PageController();
  String? languageTitle;
  List<Slide> slideList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is InitAuthState) {
        slideList = state.slides;
      } else if (state is ChangeLanguageState) {
        EasyLocalization.of(context)?.setLocale(state.locale);
        AppUtils.saveLanguage(state.locale);
      } else if (state is ReloadUIScreenState) {
        languageTitle = state.language;
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
            ChangeLanguage(
              title: languageTitle,
              onClick: (locale) {
                context.read<AuthBloc>().add(ChangeLanguageEvent(locale));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: slideList.length,
                    controller: pageController,
                    itemBuilder: (context, index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(slideList[index].image),
                            const SizedBox(height: 24.0),
                            Text(slideList[index].title.tr(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                )),
                            slideList[index].desc != null
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(slideList[index].desc!.tr(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        )),
                                  )
                                : const SizedBox(),
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
                  onClick: () async {
                    final language =
                        await Navigator.pushNamed(context, AppConstant.signIn)
                            as String?;
                    if (language != null) {
                      // ignore: use_build_context_synchronously
                      context
                          .read<AuthBloc>()
                          .add(ReloadUIScreenEvent(language));
                    }
                  }),
              const SizedBox(height: 12.0),
              GeneralButton(
                  content: 'sign_up'.tr(),
                  backgroundColor: Colors.white,
                  textColor: Colors.green.shade700,
                  isOutlineBorder: true,
                  onClick: () {
                    Navigator.pushNamed(context, AppConstant.signUp);
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
