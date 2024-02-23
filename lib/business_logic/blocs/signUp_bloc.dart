import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/business_logic/events/signUp_event.dart';
import 'package:food_delivery/business_logic/states/signUp_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(InitSignUpState());
}
