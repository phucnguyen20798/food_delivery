import 'package:bloc/bloc.dart';
import 'package:food_delivery/business_logic/states/signIn_state.dart';

import '../events/signIn_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(InitSignInState()) {
    
  }


}