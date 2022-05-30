import 'package:ecogram/settings.dart';

class Api {
  static String get baseURL => '${Settings.baseUrl}';
  static String get auth => '$baseURL/user/registerUser';
  static String get otp => '$baseURL/user/verifyCode';
}
