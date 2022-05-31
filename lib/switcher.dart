import 'package:ecogram/screens/auth/login.dart';
import 'package:ecogram/screens/home.dart';
import 'package:flutter/cupertino.dart';

class SwitcherController extends StatelessWidget {
  const SwitcherController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeController();
  }
}
