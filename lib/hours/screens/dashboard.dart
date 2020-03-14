import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/card.dart';
import '../context.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _hasFetched;

  @override
  void initState() {
    _hasFetched = false;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_hasFetched) {
      Provider.of<HoursContext>(context).list();

      _hasFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = Provider.of<HoursContext>(context).isLoading;
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
              child: isLoading
                  ? Text('Cargando horas...')
                  : Text('No hay horas cargadas'),
            )
          : ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, int) => HoursCard(hours[int]),
            ),
    );
  }
}
