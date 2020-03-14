import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import "./models.dart";

/// Hours resources
class HoursResource {
  final _uri =
      'https://gaia-gestion-backend-testing.herokuapp.com/api/working-hours/';
  final _storage = new FlutterSecureStorage();

  /// Fetch all dogs
  Future<List<Registry>> list() async {
    String token = await _storage.read(key: 'token');

    final http.Response response = await http.get(
      _uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      },
    );

    if (response.statusCode == 200) {
      var registries = jsonDecode(response.body);

      return List<Registry>.from(
        registries.map(
          (registry) => Registry.fromJson(registry),
        ),
      );
    } else {
      throw Exception('Failed to fetch hours');
    }
  }
}
