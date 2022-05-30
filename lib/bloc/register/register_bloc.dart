import 'package:bloc/bloc.dart';
import 'package:ecogram/repositories/auth.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    final client = http.Client();
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        await AuthRepository.register(client, event.data);
        emit(RegisterCompliedState());
      } on Exception catch (e) {
        emit(RegisterFailedState(error: e));
      }
    });

    on<ReloadRegisterEvent>((event, emit) async {
      emit(RegisterCompliedState());
    });
  }
}
