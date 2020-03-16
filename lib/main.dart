import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './session/context.dart';
import './hours/context.dart';
import './hours/screens/dashboard.dart';
import './hours/screens/register.dart';
import './globals.dart';

void main() => runApp(App());

/// App component
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SessionProvider(
        child: Builder(builder: (context) {
          var user = Provider.of<SessionContext>(context).user;

          return ChangeNotifierProvider(
            create: (context) => HoursContext(user),
            child: MaterialApp(
              theme: theme,
              initialRoute: '/dashboard',
              routes: {
                '/dashboard': (context) => DashboardScreen(),
                '/register': (context) => RegisterScreen(),
              },
            ),
          );
        }),
      );
}
