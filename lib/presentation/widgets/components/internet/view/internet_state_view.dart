import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/presentation/constants/app_color.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';
import 'package:food_delivery/presentation/widgets/components/internet/bloc/internet_bloc.dart';

import '../../../../screens/container/container_screen.dart';

class InternetStateView extends StatelessWidget {
  final Widget? child;
  const InternetStateView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        if (state is ConnectInternet) {
          return child ?? const ContainerScreen();
        }
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColor.backgroundColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Food Delivery',
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 96.0,
                  color: AppColor.tealColor,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'No internet conntection !',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.tealColor,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text('Please check your network connection.'),
                const SizedBox(height: 16.0),
                GeneralButton(
                  content: 'try again'.toUpperCase(),
                  width: 200.0,
                  textColor: AppColor.tealColor,
                  borderColor: AppColor.tealColor,
                  borderRadius: 8.0,
                  isOutlineBorder: true,
                  onClick: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
