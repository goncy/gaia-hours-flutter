import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card.dart';
import '../context.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _hours = Provider.of<HoursContext>(context).registries;
    var _isLoading = Provider.of<HoursContext>(context).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text("Listado de horas"), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/register'),
        ),
      ]),
      body: _hours.isEmpty
          ? Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('No hay horas cargadas'),
            )
          : ListView.builder(
              itemCount: _hours.length,
              itemBuilder: (context, int) => HoursCard(_hours[int]),
            ),
    );
  }
}
