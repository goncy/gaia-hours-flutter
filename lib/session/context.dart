import 'package:flutter/widgets.dart';

import './models.dart';
import './resource.dart';

/// Session context
class SessionContext extends ChangeNotifier {
  final SessionResource _resource = SessionResource();

  /// Status
  bool isLoading = false;

  /// User
  User user;

  /// SessionContext constructor
  SessionContext();

  /// Login
  Future login(String username, String password) async {
    try {
      isLoading = true;

      notifyListeners();

      user = await _resource.login(username, password);
      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
      notifyListeners();

      throw exception;
    }
  }
}
