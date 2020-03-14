import 'package:flutter/widgets.dart';

import './models.dart';
import './resource.dart';

/// Hours context
class HoursContext extends ChangeNotifier {
  final HoursResource _resource = HoursResource();

  /// Hours context loading status
  bool isLoading = false;

  /// Hours list
  List<Registry> registries = [];

  /// Fetch on initialize
  HoursContext();

  void list() async {
    try {
      isLoading = true;

      notifyListeners();

      registries = await _resource.list();
      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
      print(exception);
    }
  }

  /// Add registries
  void add(Registry registry) async {
    // await _resource.add(registry);

    registries.add(registry);

    notifyListeners();
  }
}
