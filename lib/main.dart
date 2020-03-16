import 'package:flutter/material.dart';

import './globals.dart';
import './hours/context.dart';
import './hours/screens/dashboard.dart';
import './hours/screens/register.dart';
import './session/context.dart';

void main() => runApp(App());

/// App component
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SessionProvider(
        builder: (user) => HoursProvider(
          user: user,
          child: MaterialApp(
            theme: theme,
            initialRoute: '/dashboard',
            routes: {
              '/dashboard': (context) => DashboardScreen(),
              '/register': (context) => RegisterScreen(),
            },
          ),
        ),
      );
}
