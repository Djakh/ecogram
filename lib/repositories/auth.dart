import 'dart:convert';

import 'package:ecogram/api.dart';
import 'package:ecogram/repositories/repo_set/http_methods.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static Future<void> register(
    http.Client client,
    Map<String, dynamic> data,
  ) async {
    await RepositoryUtils.postData(
      client,
      "${Api.auth}",
      data: data,
    );
  }

  static Future<String> verifyOtp(
    http.Client client,
    Map<String, dynamic> data,
  ) async {
    final response = await RepositoryUtils.postData(
      client,
      "${Api.otp}",
      data: data,
    );

    // Parse response.
    var body = json.decode(response.body);

    return body["object"];
  }
}
