import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../context.dart';

/// Add page
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  String _username;
  String _password;

  void _handleSubmit() async {
    var login = Provider.of<SessionContext>(context, listen: false).login;

    if (_form.currentState.validate()) {
      _form.currentState.save();

      try {
        await login(_username, _password);
      } on Exception catch (e) {
        _scaffold.currentState.showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = Provider.of<SessionContext>(context).isLoading;

    return Scaffold(
      key: _scaffold,
      appBar: AppBar(title: Text('Login')),
      body: Form(
        key: _form,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 32.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    onSaved: (username) => _username = username,
                    validator: (username) =>
                        username.isEmpty ? 'Este campo es requerido' : null,
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    onSaved: (password) => _password = password,
                    validator: (password) =>
                        password.isEmpty ? 'Este campo es requerido' : null,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    onPressed: _handleSubmit,
                    child: isLoading
                        ? Text('Iniciando sesión')
                        : Text('Iniciar sesión'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
