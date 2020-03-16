import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import "./models.dart";

/// Session resources
class SessionResource {
  final _uri = 'https://gaia-gestion-backend-testing.herokuapp.com/auth/';
  final _storage = FlutterSecureStorage();

  /// Login
  Future<User> login(String username, String password) async {
    var response = await http.post(
      _uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var session = jsonDecode(response.body);

      await _storage.write(key: 'token', value: session['key']);

      return User.fromJson(session['user']);
    } else {
      throw Exception('Failed to log in');
    }
  }
}
