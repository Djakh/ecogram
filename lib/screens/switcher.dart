import 'package:ecogram/bloc/app.dart';
import 'package:ecogram/screens/auth/login.dart';
import 'package:ecogram/screens/intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Switcher extends StatelessWidget {
  const Switcher({Key key}) : super(key: key);

  Widget get loginOrHomeSwitcher => const LoginController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return state.showIntro ? const IntroController() : loginOrHomeSwitcher;
      },
    );
  }
}
