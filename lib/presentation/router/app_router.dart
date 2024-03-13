import 'package:flutter/material.dart';
import 'package:food_delivery/di.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:food_delivery/presentation/screens/auth/auth_screen.dart';
import 'package:food_delivery/presentation/screens/detail_restaurant/detail_restaurant_screen.dart';
import 'package:food_delivery/presentation/screens/home/home_screen.dart';
import 'package:food_delivery/presentation/screens/order/order_screen.dart';
import 'package:food_delivery/presentation/screens/profile/profile_screen.dart';
import 'package:food_delivery/presentation/screens/input_infor/input_infor_screen.dart';
import 'package:food_delivery/presentation/screens/signIn/signIn_screen.dart';
import 'package:food_delivery/presentation/screens/signUp/signUp_screen.dart';
import 'package:food_delivery/presentation/screens/verify/verify_otp_screen.dart';
import 'package:food_delivery/presentation/screens/welcome/welcome_screen.dart';
import 'package:food_delivery/presentation/widgets/components/internet/internet_state_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery/presentation/screens/container/container_screen.dart';

class AppRouter {
  final prefs = getIt.get<SharedPreferences>();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppConstant.home:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: HomeScreen()));
      case AppConstant.welcome:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: AuthScreen()));
      case AppConstant.signIn:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: SignInScreen()));
      case AppConstant.profile:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: ProfileScreen()));
      case AppConstant.order:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: OrderScreen()));
      case AppConstant.signUp:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: SignUpScreen()));
      case AppConstant.verifyOTP:
        final String phone = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) =>
                InternetStateScreen(child: VerifyOTPScreen(phone: phone)));
      case AppConstant.inputInfor:
        return MaterialPageRoute(
            builder: (_) =>
                const InternetStateScreen(child: InputInforScreen()));
      case AppConstant.init:
        final phoneNumber = prefs.getString(AppConstant.phone);
        if (phoneNumber != null) {
          return MaterialPageRoute(
              builder: (_) =>
                  const InternetStateScreen(child: ContainerScreen()));
        }
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: WelcomeScreen()));
      case AppConstant.detailRestaurant:
        return MaterialPageRoute(
            builder: (_) =>
                const InternetStateScreen(child: DetailRestaurantScreen()));
      case AppConstant.internetState:
        return MaterialPageRoute(builder: (_) => const InternetStateScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const InternetStateScreen(child: AuthScreen()));
    }
  }
}
