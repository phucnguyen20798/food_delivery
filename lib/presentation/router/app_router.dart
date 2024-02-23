import 'package:flutter/material.dart';
import 'package:food_delivery/di.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:food_delivery/presentation/screens/auth/auth_screen.dart';
import 'package:food_delivery/presentation/screens/home/home_screen.dart';
import 'package:food_delivery/presentation/screens/input_infor/input_infor_screen.dart';
import 'package:food_delivery/presentation/screens/signIn/signIn_screen.dart';
import 'package:food_delivery/presentation/screens/signUp/signUp_screen.dart';
import 'package:food_delivery/presentation/screens/verify/verify_otp_screen.dart';
import 'package:food_delivery/presentation/screens/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  final prefs = getIt.get<SharedPreferences>();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppConstant.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppConstant.welcome:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case AppConstant.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppConstant.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppConstant.verifyOTP:
        final String phone = routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_) => VerifyOTPScreen(phone: phone));
      case AppConstant.inputInfor:
        return MaterialPageRoute(builder: (_) => const InputInforScreen());
      case AppConstant.init:
        final phoneNumber = prefs.getString(AppConstant.phone);
        if(phoneNumber != null) {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
