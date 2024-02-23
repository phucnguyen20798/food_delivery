import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/events/verify_otp_event.dart';
import 'package:food_delivery/business_logic/states/verify_otp_state.dart';
import 'package:food_delivery/data/repositories/food_delivery_repository.dart';
import 'package:food_delivery/di.dart';
import 'package:food_delivery/presentation/constants/app_constant.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  final repository = getIt.get<FoodDeliveryRepository>();
  final prefs = getIt.get<SharedPreferences>();

  VerifyOTPBloc() : super(EmptyState()) {
    on(_onInit);
    on(_onResendOTP);
    on(_onVerifyComplete);
    on(_onStartTimeCountDown);
    on(_onEndTimeCountDown);
  }

  void _onInit(InitVerifyOTPEvent event, Emitter<VerifyOTPState> emitter) {
    _sendOTP(event.phone, () => null);
    log('OTP Sent');
  }

  void _onResendOTP(ResendOTPEvent event, Emitter<VerifyOTPState> emitter) {
    add(StartTimeCountDownEvent());
    log('OTP Resend');
    _sendOTP(event.phone, () {});
  }

  void _onVerifyComplete(
      VerifyOTPCompletedEvent event, Emitter<VerifyOTPState> emitter) {
    print(event.pin);
    prefs.setString(AppConstant.phone, event.phone);
    emitter(VerifyOTPCompleteState());
  }

  void _onStartTimeCountDown(
      StartTimeCountDownEvent event, Emitter<VerifyOTPState> emitter) {
    emitter(StartTimeCountDownState());
  }

  void _onEndTimeCountDown(
      EndTimeCountDownEvent event, Emitter<VerifyOTPState> emitter) {
    emitter(EndTimeCountDownState());
  }

  void _sendOTP(String phone, Function() onVerify) {
    repository.verifyPhoneNumberWithOTP(
        phone: TextUtils.getPhoneNumber(phone),
        verificationCompleted: (authCredential) {
          onVerify();
        },
        onFailure: (error) {},
        codeSent: (verificationID, resendToken) {},
        codeAutoRetrievalTimeout: (timeOut) {});
  }
}
