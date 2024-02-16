import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/events/verify_otp_event.dart';
import 'package:food_delivery/business_logic/states/verify_otp_state.dart';
import 'package:food_delivery/data/repositories/food_delivery_repository.dart';
import 'package:food_delivery/di.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  final repository = getIt.get<FoodDeliveryRepository>();

  VerifyOTPBloc() : super(EmptyState()) {
    on(_onInit);
    on(_onResendOTP);
    on(_onVerifyComplete);
  }

  void _onInit(InitVerifyOTPEvent event, Emitter<VerifyOTPState> emitter) {
    repository.verifyPhoneNumberWithOTP(
        phone: TextUtils.getPhoneNumber(event.phone),
        verificationCompleted: (authCredential) {
          emitter(InitVerifyOTPState(authCredential.smsCode));
        },
        onFailure: (error) {},
        codeSent: (verificationID, resendToken) {},
        codeAutoRetrievalTimeout: (timeOut) {});
  }

  void _onResendOTP(ResendOTPEvent event, Emitter<VerifyOTPState> emitter) {
    add(InitVerifyOTPEvent(event.phone));
  }

  void _onVerifyComplete(
      VerifyOTPCompletedEvent event, Emitter<VerifyOTPState> emitter) {
    print(event.pin);
    emitter(VerifyOTPCompleteState());
  }
}
