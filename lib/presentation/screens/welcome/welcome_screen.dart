import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';

import '../../constants/app_color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeScreen> {
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, AppConstant.welcome);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_app.png',
              width: 80.0,
              height: 80.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Food Delivery',
              style: TextStyle(
                fontSize: 24.0,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            CircularProgressIndicator(
              strokeWidth: 3.0,
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
