import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../session/context.dart';

/// Add page
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();

  String _username;
  String _password;

  void _handleSubmit() {
    var login = Provider.of<SessionContext>(context, listen: false).login;

    if (_form.currentState.validate()) {
      _form.currentState.save();

      login(_username, _password);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Register')),
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
                            username.isEmpty ? 'This field is required' : null,
                        decoration: InputDecoration(
                          labelText: 'Username',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                        onSaved: (password) => _password = password,
                        validator: (password) =>
                            password.isEmpty ? 'This field is required' : null,
                        decoration: InputDecoration(
                          labelText: "Password",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (context) => RaisedButton(
                        onPressed: _handleSubmit,
                        child: Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
