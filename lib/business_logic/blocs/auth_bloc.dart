import 'package:bloc/bloc.dart';
import 'package:food_delivery/business_logic/events/auth_event.dart';
import 'package:food_delivery/business_logic/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitAuthState()) {
    
  }
}