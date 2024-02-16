abstract class VerifyOTPEvent {}

class InitVerifyOTPEvent extends VerifyOTPEvent {
  final String phone;

  InitVerifyOTPEvent(this.phone);
}

class ResendOTPEvent extends VerifyOTPEvent {
  final String phone;

  ResendOTPEvent(this.phone);
}

class VerifyOTPCompletedEvent extends VerifyOTPEvent {
  final String pin;

  VerifyOTPCompletedEvent(this.pin);
}
