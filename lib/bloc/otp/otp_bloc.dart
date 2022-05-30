import 'package:bloc/bloc.dart';
import 'package:ecogram/repositories/auth.dart';
import 'package:ecogram/utils/logger.dart';
import 'package:ecogram/utils/preferences.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitialState()) {
    final client = http.Client();
    on<VerifyOtpEvent>((event, emit) async {
      emit(OtpLoadingState());
      try {
        final token = await AuthRepository.verifyOtp(client, event.data);
        if (await Preferences.setToken(token)) {
          emit(OtpCompliedState(token: token));
          logger.d('token saved');
        } else {
          logger.d('token cannot be saved');
          emit(OtpFailedState(error: Exception("Cannot save token")));
        }
      } on Exception catch (e) {
        emit(OtpFailedState(error: e));
      }
    });
  }
}
