import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card.dart';
import '../context.dart';

/// Home page
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hours = Provider.of<HoursContext>(context).registries;

    return Scaffold(
      appBar: AppBar(title: Text("Listado de horas"), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/register'),
        ),
      ]),
      body: hours.isEmpty
          ? Center(
              child: Text('No hay horas cargadas'),
            )
          : ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, int) => HoursCard(hours[int]),
            ),
    );
  }
}
