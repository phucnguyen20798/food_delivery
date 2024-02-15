import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/blocs/verify_otp_bloc.dart';
import 'package:food_delivery/business_logic/states/verify_otp_state.dart';
import 'package:food_delivery/presentation/widgets/components/general_button.dart';
import 'package:pinput/pinput.dart';

class VerifyOTPView extends StatelessWidget {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyOTPBloc, VerifyOTPState>(
        builder: (context, state) {
      String phoneNumber = '';
      if (state is InitVerifyOTPState) {
        phoneNumber = state.phone;
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
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              RichText(
                  text: TextSpan(
                      text:
                          'Chúng tôi đã gửi một mã xác minh gồm 4 chữ số tới số điện thoại ',
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
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
              const SizedBox(height: 56.0),
              GeneralButton(
                content: 'Verify OTP',
                backgroundColor: Colors.green.shade700,
                textColor: Colors.white,
                onClick: () {},
              ),
              const SizedBox(height: 16.0),
              Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Didn't you receive OTP ? ",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Resend OTP',
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: TextStyle(
                              fontSize: 16.0,
                              decoration: TextDecoration.underline,
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ])),
              ),
            ],
          ),
        ),
      );
    });
  }
}
