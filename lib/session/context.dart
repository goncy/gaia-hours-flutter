import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../globals.dart';

import './models.dart';
import './resource.dart';
import './screens/login.dart';

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
    } on Exception {
      notifyListeners();

      rethrow;
    }
  }
}

/// Session provider
class SessionProvider extends StatelessWidget {
  /// Child widget
  final Widget child;

  /// Widget builder
  final Widget Function(User user) builder;

  /// Constructor
  SessionProvider({this.child, this.builder});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SessionContext(),
        child: _SessionProvider(child: child, builder: builder),
      );
}

class _SessionProvider extends StatelessWidget {
  final Widget child;
  final Widget Function(User user) builder;

  _SessionProvider({this.child, this.builder});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<SessionContext>(context).user;

    return user != null
        ? builder != null ? builder(user) : child
        : MaterialApp(
            theme: theme,
            home: LoginScreen(),
          );
  }
}
