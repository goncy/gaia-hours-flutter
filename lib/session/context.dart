import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

import './screens/login.dart';
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

class SessionProvider extends StatelessWidget {
  final Widget child;

  SessionProvider({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SessionContext(),
        child: _SessionProvider(child),
      );
}

class _SessionProvider extends StatelessWidget {
  final Widget child;

  _SessionProvider(this.child);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<SessionContext>(context).user;

    return user != null
        ? child
        : MaterialApp(
            theme: theme,
            home: LoginScreen(),
          );
  }
}
