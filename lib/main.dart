import 'package:ecogram/app.dart';
import 'package:ecogram/settings.dart';
import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setEnvironment(Environment.Production);

  runApp(const EcogramApp());
}
