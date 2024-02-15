import 'package:flutter/material.dart';

abstract class SignInEvent {}

class ChangeLanguageEvent extends SignInEvent {
  final Locale locale;

  ChangeLanguageEvent(this.locale);
}
