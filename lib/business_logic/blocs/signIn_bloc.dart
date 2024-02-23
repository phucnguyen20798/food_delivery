import 'package:bloc/bloc.dart';
import 'package:food_delivery/business_logic/states/signIn_state.dart';
import 'package:food_delivery/presentation/utils/text_utils.dart';

import '../events/signIn_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(InitSignInState()) {
    on(_onChangeLanguage);
    on(_onValidatePhoneNumber);
    on(_onValidatePhoneNumberFailure);
  }

  void _onChangeLanguage(
      ChangeLanguageEvent event, Emitter<SignInState> emitter) {
    emitter(ChangeLanguageState(event.locale));
  }

  void _onValidatePhoneNumber(
      ValidatePhoneNumberEvent event, Emitter<SignInState> emitter) {
    String? message = TextUtils.validatePhoneNumber(event.phone);
    if (message == null) {
      emitter(ValidatePhoneNumberState());
    } else {
      add(ValidatePhoneNumberFailureEvent(message));
    }
  }

  void _onValidatePhoneNumberFailure(
      ValidatePhoneNumberFailureEvent event, Emitter<SignInState> emitter) {
    emitter(ValidatePhoneNumberFailureState(event.message));
  }
}
