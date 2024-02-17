import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:food_delivery/business_logic/blocs/verify_otp_bloc.dart';
import 'package:food_delivery/business_logic/events/verify_otp_event.dart';
import 'package:food_delivery/business_logic/states/verify_otp_state.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:pinput/pinput.dart';

bool isCountDown = false;

class VerifyOTPView extends StatelessWidget {
  final String phoneNumber;

  const VerifyOTPView({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOTPBloc, VerifyOTPState>(
      builder: (context, state) {
        String? otpPhoneCode;
        if (state is InitVerifyOTPState) {
          otpPhoneCode = state.code;
        } else if (state is StartTimeCountDownState) {
          isCountDown = true;
        } else if (state is EndTimeCountDownState) {
          isCountDown = false;
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32.0),
                Text(
                  'verify_otp.title'.tr(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                RichText(
                    text: TextSpan(
                        text: 'verify_otp.desc'.tr(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                        text: phoneNumber,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ])),
                const SizedBox(height: 32.0),
                Center(
                  child: Pinput(
                    androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(234, 239, 243, 1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(234, 239, 243, 1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(234, 239, 243, 1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (otpCode) {
                      log('OTP input: $otpCode - OTP Send: $otpPhoneCode');
                      return otpCode != null
                          ? null
                          : 'Mã xác minh không được để trống';
                    },
                    errorTextStyle: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      context
                          .read<VerifyOTPBloc>()
                          .add(VerifyOTPCompletedEvent(pin));
                    },
                    length: 6,
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'didnot_receive_otp'.tr(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      isCountDown == true
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'resend'.tr(),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TimerCountdown(
                                  enableDescriptions: false,
                                  spacerWidth: 4.0,
                                  timeTextStyle: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  format: CountDownTimerFormat.minutesSeconds,
                                  endTime: DateTime.now()
                                      .add(const Duration(seconds: 120)),
                                  onEnd: () {
                                    context
                                        .read<VerifyOTPBloc>()
                                        .add(EndTimeCountDownEvent());
                                  },
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                context
                                    .read<VerifyOTPBloc>()
                                    .add(ResendOTPEvent(phoneNumber));
                              },
                              child: Text(
                                'resend_otp'.tr(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  decoration: TextDecoration.underline,
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, VerifyOTPState state) {
        if (state is VerifyOTPCompleteState) {
          Navigator.pushNamed(context, AppConstant.home);
        }
      },
    );
  }
}
