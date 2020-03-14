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
  bool _isLoading;

  @override
  void initState() {
    _hasFetched = false;
    _isLoading = true;

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (!_hasFetched) {
      _hasFetched = true;

      await Provider.of<HoursContext>(context).list();

      _isLoading = false;
    }
  }

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
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('No hay horas cargadas'),
            )
          : ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, int) => HoursCard(hours[int]),
            ),
    );
  }
}
