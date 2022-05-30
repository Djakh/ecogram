part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final Map<String, dynamic> data;

  RegisterUserEvent(this.data);
}

class ReloadRegisterEvent extends RegisterEvent {

  ReloadRegisterEvent();
}
