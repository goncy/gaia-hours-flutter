import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models.dart';

/// Hours details screen
class DetailsScreen extends StatefulWidget {
  /// Hours
  final Registry registry;

  /// Hours details screen constructor
  DetailsScreen(this.registry);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.registry.project.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.registry.project.name,
              style: const TextStyle(fontSize: 32.0),
            ),
            Text(
              widget.registry.category.name,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.registry.hours,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
