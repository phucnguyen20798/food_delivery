import 'package:flutter/material.dart';

abstract class AuthEvent {}

class ChangeLanguageEvent extends AuthEvent {
  Locale locale;

  ChangeLanguageEvent(this.locale);
}
