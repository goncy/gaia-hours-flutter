import 'package:flutter/material.dart';

import '../catalogs/models.dart';
import '../session/models.dart';

/// Registry class
class Registry {
  /// Registry id
  final String id;

  /// Registry user
  final User user;

  /// Registry project
  final Project project;

  /// Registry category
  final Category category;

  /// Registry description
  final String description;

  /// Registry dateWorked
  final String dateWorked;

  /// Registry hours
  final String hours;

  /// Create Registry from json
  factory Registry.fromJson(dynamic registry) {
    return Registry(
      id: registry['id'],
      user: User.fromJson(registry['user']),
      project: Project.fromJson(registry['project']),
      category: Category.fromJson(registry['working_hour_category']),
      description: registry['description'],
      dateWorked: registry['date_worked'],
      hours: registry['hours'],
    );
  }

  /// Registry constructor
  Registry({
    @required this.id,
    this.user,
    this.project,
    this.category,
    this.description,
    this.dateWorked,
    this.hours,
  });
}
