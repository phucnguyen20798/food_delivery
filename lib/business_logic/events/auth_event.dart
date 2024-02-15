import 'package:flutter/material.dart';

abstract class AuthEvent {}

class InitAuthEvent extends AuthEvent {}

class ChangeLanguageEvent extends AuthEvent {
  final Locale locale;

  ChangeLanguageEvent(this.locale);
}

class ReloadUIScreenEvent extends AuthEvent {
  final String language;

  ReloadUIScreenEvent(this.language);
}
