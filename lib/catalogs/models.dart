import 'package:flutter/material.dart';

/// Project class
class Project {
  /// Project id
  final int id;

  /// Project name
  final String name;

  /// Project totalHours
  final String totalHours;

  /// Create Project from json
  factory Project.fromJson(dynamic registry) {
    return Project(
      id: registry['id'],
      name: registry['name'],
      totalHours: registry['total_hours'],
    );
  }

  /// Project constructor
  Project({
    @required this.id,
    this.name,
    this.totalHours,
  });
}

/// Category class
class Category {
  /// Category id
  final int id;

  /// Category name
  final String name;

  /// Create Category from json
  factory Category.fromJson(dynamic registry) {
    return Category(
      id: registry['id'],
      name: registry['name'],
    );
  }

  /// Category constructor
  Category({
    @required this.id,
    this.name,
  });
}
