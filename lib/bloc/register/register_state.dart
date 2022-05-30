part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterCompliedState extends RegisterState {
  RegisterCompliedState();
}

class RegisterFailedState extends RegisterState {
  final Exception? error;
  RegisterFailedState({this.error});
}
