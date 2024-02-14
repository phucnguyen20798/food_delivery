import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/screens/auth/auth_screen.dart';
import 'package:food_delivery/presentation/screens/home/home_screen.dart';
import 'package:food_delivery/presentation/screens/signIn/signIn_screen.dart';
import 'package:food_delivery/presentation/screens/signUp/signUp_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
