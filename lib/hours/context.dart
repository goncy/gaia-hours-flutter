import 'package:flutter/widgets.dart';

import '../session/models.dart';

import './models.dart';
import './resource.dart';

/// Hours context
class HoursContext extends ChangeNotifier {
  final HoursResource _resource = HoursResource();

  /// Status
  bool isLoading = false;

  /// Hours list
  List<Registry> registries = [];

  /// User
  User _user;

  /// Constructor
  HoursContext();

  void init(User user) {
    _user = user;

    list();
  }

  Future list() async {
    try {
      isLoading = true;

      registries = await _resource.list();

      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
      print(exception);
    }
  }

  /// Add registries
  Future add(int hours, int project, int category) async {
    isLoading = true;

    registries.add(await _resource.add(_user.id, hours, project, category));

    isLoading = false;

    notifyListeners();
  }
}
