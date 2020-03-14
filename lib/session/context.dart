import 'package:flutter/widgets.dart';

import './models.dart';
import './resource.dart';

/// Session context
class SessionContext extends ChangeNotifier {
  final SessionResource _resource = SessionResource();

  /// Session context loading status
  bool isLoading = false;

  /// Sessions list
  Session session;

  /// SessionContext constructor
  SessionContext();

  /// Login
  Future login(String username, String password) async {
    try {
      isLoading = true;

      notifyListeners();

      session = await _resource.login(username, password);
      isLoading = false;

      notifyListeners();
    } on Exception catch (exception) {
      isLoading = false;

      notifyListeners();

      throw exception;
    }
  }
}
