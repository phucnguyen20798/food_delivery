import 'package:equatable/equatable.dart';

abstract class VerifyOTPState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptyState extends VerifyOTPState {}

class InitVerifyOTPState extends VerifyOTPState {
  final String phone;

  InitVerifyOTPState(this.phone);

  @override
  List<Object?> get props => [phone];
}
