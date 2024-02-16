import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitSignInState extends SignInState {}

class ChangeLanguageState extends SignInState {
  final Locale locale;

  ChangeLanguageState(this.locale);

  @override
  List<Object?> get props => [locale];
}

class ValidatePhoneNumberState extends SignInState {}

class ValidatePhoneNumberFailureState extends SignInState {
  final String message;

  ValidatePhoneNumberFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
