import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/verify_otp_bloc.dart';
import 'package:food_delivery/business_logic/events/verify_otp_event.dart';
import 'package:food_delivery/presentation/screens/verify/verify_otp_view.dart';

class VerifyOTPScreen extends StatelessWidget {
  final String phone;

  const VerifyOTPScreen({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyOTPBloc()..add(InitVerifyOTPEvent(phone)),
      child: const VerifyOTPView(),
    );
  }
}
