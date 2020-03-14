import 'package:flutter/material.dart';

/// User class
class User {
  /// User id
  final int id;

  /// User username
  final String username;

  /// User email
  final String email;

  /// User firstName
  final String firstName;

  /// User lastName
  final String lastName;

  /// Create User from json
  factory User.fromJson(dynamic user) {
    return User(
      id: user['id'],
      username: user['username'],
      email: user['email'],
      firstName: user['first_name'],
      lastName: user['last_name'],
    );
  }

  /// User constructor
  User({
    @required this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });
}
