import 'package:flutter/widgets.dart';

import '../session/models.dart';

import './models.dart';
import './resource.dart';

/// Hours context
class HoursContext extends ChangeNotifier {
  final HoursResource _resource = HoursResource();

  /// Hours list
  List<Registry> registries = [];

  /// User
  User user;

  /// Constructor
  HoursContext();

  Future list() async {
    try {
      registries = await _resource.list();

      notifyListeners();
    } on Exception catch (exception) {
      print(exception);
    }
  }

  /// Add registries
  Future add(int hours, int project, int category) async {
    registries.add(await _resource.add(user.id, hours, project, category));

    notifyListeners();
  }
}
