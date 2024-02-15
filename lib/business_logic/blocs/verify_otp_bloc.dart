import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/events/verify_otp_event.dart';
import 'package:food_delivery/business_logic/states/verify_otp_state.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  VerifyOTPBloc() : super(EmptyState()) {
    on(_onVerifyOTP);
  }

  void _onVerifyOTP(InitVerifyOTPEvent event, Emitter<VerifyOTPState> emitter) {
    emitter(InitVerifyOTPState(event.phone));
  }
}
