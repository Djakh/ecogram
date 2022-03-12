import 'package:ecogram/utils/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  bool showIntro;

  AppState({this.showIntro = false});
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {
    init();
  }

  void init() async {
    bool introFinished = await Preferences.getIntroFinished();
    emit(AppState(showIntro: !introFinished));
  }

  void setShowIntro() async {
    await Preferences.setIntroFinished(true);
    emit(AppState(showIntro: false));
  }
}
