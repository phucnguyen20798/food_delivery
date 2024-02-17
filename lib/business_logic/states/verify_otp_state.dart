import 'package:equatable/equatable.dart';

abstract class VerifyOTPState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyState extends VerifyOTPState {}

class InitVerifyOTPState extends VerifyOTPState {
  final String? code;

  InitVerifyOTPState(this.code);

  @override
  List<Object?> get props => [code];
}

class VerifyOTPCompleteState extends VerifyOTPState {}

class StartTimeCountDownState extends VerifyOTPState {}

class EndTimeCountDownState extends VerifyOTPState {}