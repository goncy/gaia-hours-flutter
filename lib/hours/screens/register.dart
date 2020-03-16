import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../context.dart';

/// Add page
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();

  int _hours;
  int _project;
  int _category;

  void _handleSubmit() async {
    var add = Provider.of<HoursContext>(context, listen: false).add;

    if (_form.currentState.validate()) {
      _form.currentState.save();

      await add(_hours, _project, _category);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = Provider.of<HoursContext>(context).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar horas'),
      ),
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
                    keyboardType: TextInputType.number,
                    onSaved: (hours) => _hours = int.parse(hours),
                    validator: (hours) =>
                        hours.isEmpty ? 'Este campo es requerido' : null,
                    decoration: InputDecoration(
                      labelText: 'Horas',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DropdownButtonFormField<int>(
                    onChanged: (project) => _project = project,
                    items: [
                      DropdownMenuItem<int>(
                        child: Text('Gaia'),
                        value: 1,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Tennis Pyramid'),
                        value: 2,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Donde Comemos'),
                        value: 3,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('PSA'),
                        value: 4,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('FACTTIC'),
                        value: 5,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('APPO'),
                        value: 6,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Astrologia'),
                        value: 7,
                      ),
                    ],
                    validator: (project) =>
                        project.isNaN ? 'Este campo es requerido' : null,
                    decoration: InputDecoration(
                      labelText: "Proyecto",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DropdownButtonFormField<int>(
                    onChanged: (category) => _category = category,
                    items: [
                      DropdownMenuItem<int>(
                        child: Text('Gestión'),
                        value: 1,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Reunión'),
                        value: 2,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Desarrollo'),
                        value: 3,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Deploy'),
                        value: 4,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('Asamblea'),
                        value: 5,
                      ),
                    ],
                    validator: (category) =>
                        category.isNaN ? 'Este campo es requerido' : null,
                    decoration: InputDecoration(
                      labelText: "Categoria",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) => RaisedButton(
                      onPressed: _handleSubmit,
                      child:
                          isLoading ? Text('Registrando') : Text('Registrar'),
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
}
