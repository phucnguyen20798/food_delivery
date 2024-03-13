import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeEvent extends HomeEvent {}