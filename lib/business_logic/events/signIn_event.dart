import 'package:flutter/material.dart';

abstract class SignInEvent {}

class ChangeLanguageEvent extends SignInEvent {
  final Locale locale;

  ChangeLanguageEvent(this.locale);
}

class ValidatePhoneNumberEvent extends SignInEvent {
  String phone;

  ValidatePhoneNumberEvent(this.phone);
}

class ValidatePhoneNumberFailureEvent extends SignInEvent {
  String message;

  ValidatePhoneNumberFailureEvent(this.message);
}
