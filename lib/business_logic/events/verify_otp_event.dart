abstract class VerifyOTPEvent {}

class InitVerifyOTPEvent extends VerifyOTPEvent {
  final String phone;

  InitVerifyOTPEvent(this.phone);
}
