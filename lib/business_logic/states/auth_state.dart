import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/slide.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyState extends AuthState {}

class InitAuthState extends AuthState {
  final List<Slide> slides;

  InitAuthState(this.slides);

  @override
  List<Object?> get props => [slides];
}

class ChangeLanguageState extends AuthState {
  final Locale locale;

  ChangeLanguageState(this.locale);

  @override
  List<Object?> get props => [locale];
}

class ReloadUIScreenState extends AuthState {
  final String language;

  ReloadUIScreenState(this.language);

  @override
  List<Object?> get props => [language];
}
