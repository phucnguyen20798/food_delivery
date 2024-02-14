import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitAuthState extends AuthState {}

class ChangeLanguageState extends AuthState {
  final Locale locale;

  ChangeLanguageState(this.locale);

  @override
  List<Object?> get props => [locale];
}
