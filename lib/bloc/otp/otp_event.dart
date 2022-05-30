part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class VerifyOtpEvent extends OtpEvent {
  final Map<String, dynamic> data;

  VerifyOtpEvent(this.data);
}
