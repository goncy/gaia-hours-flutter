import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import "./models.dart";

/// Session resources
class SessionResource {
  final _uri = 'https://gaia-gestion-backend-testing.herokuapp.com/auth/';
  final _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  /// Login
  Future<Session> login(String username, String password) async {
    final http.Response response = await http.post(
      _uri,
      headers: _headers,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var session = jsonDecode(response.body);

      return Session(
          token: session['key'], user: User.fromJson(session['user']));
    } else {
      throw Exception('Failed to log in');
    }
  }
}
