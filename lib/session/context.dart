import 'package:flutter/widgets.dart';

import './models.dart';
import './resource.dart';

/// Session context
class SessionContext extends ChangeNotifier {
  final SessionResource _resource = SessionResource();

  /// User
  User user;

  /// SessionContext constructor
  SessionContext();

  /// Login
  Future<User> login(String username, String password) async {
    try {
      user = await _resource.login(username, password);

      notifyListeners();

      return user;
    } on Exception catch (exception) {
      notifyListeners();

      throw exception;
    }
  }
}
