part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitialState extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpCompliedState extends OtpState {
  final String? token;
  OtpCompliedState({this.token});
}

class OtpFailedState extends OtpState {
  final Exception? error;
  OtpFailedState({this.error});
}
