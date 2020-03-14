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

  /// Fetch all registries
  Future<List<Registry>> list() async {
    String token = await _storage.read(key: 'token');

    final http.Response response = await http.get(
      _uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      },
    );

    debugPrint(response.statusCode.toString());

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

  /// Add registry
  Future<Registry> add(int user, int hours, int project, int category) async {
    String token = await _storage.read(key: 'token');

    final http.Response response = await http.post(
      _uri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token'
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': user,
        'date_worked': '2020-03-09',
        'project_id': project,
        'working_hour_category_id': category,
        'hours': hours,
      }),
    );

    if (response.statusCode == 201) {
      var registry = jsonDecode(response.body);

      return Registry.fromJson(registry);
    } else {
      throw Exception('Failed to register hours');
    }
  }
}
