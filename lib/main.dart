import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './session/screens/login.dart';
import './session/context.dart';
import './hours/context.dart';
import './hours/screens/dashboard.dart';
import './hours/screens/register.dart';

void main() => runApp(App());

/// App component
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SessionContext()),
          ChangeNotifierProxyProvider<SessionContext, HoursContext>(
              create: (_) => HoursContext(),
              update: (_, session, hours) => hours..user = session.user),
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
          ),
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/dashboard': (context) => DashboardScreen(),
            '/register': (context) => RegisterScreen(),
          },
        ),
      );
}
