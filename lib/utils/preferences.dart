import 'package:shared_preferences/shared_preferences.dart';

const String tokenKey = 'EcogramUserToken';
const String introKey = 'EcogramIntro';

class Preferences {
  static Future<bool> setIntroFinished(bool finished) async {
    final preferences = await SharedPreferences.getInstance();
    final isSaved = await preferences.setBool(introKey, finished);
    return isSaved;
  }

  static Future<bool> getIntroFinished() async {
    final preferences = await SharedPreferences.getInstance();
    final finished = preferences.getBool(introKey) ?? false;
    return finished;
  }

  static Future<bool> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    final isSaved = await preferences.setString(tokenKey, token);
    return isSaved;
  }

  static Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString(tokenKey);
    return token;
  }

  static Future<bool> clearToken() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.remove(tokenKey);
    return token;
  }
}
