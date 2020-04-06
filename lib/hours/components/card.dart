import 'package:flutter/material.dart';

import '../models.dart';
import '../screens/details.dart';

/// Hours card
class HoursCard extends StatelessWidget {
  /// Hours
  final Registry registry;

  /// HoursCard constructor
  HoursCard(this.registry);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 8, top: 8, right: 8),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsScreen(registry),
            ),
          ),
          child: Container(
              height: 120.0,
              child: Container(
                height: 120.0,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Hero(
                            tag: registry.id,
                            child: Text(
                              registry.project.name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Row(
                            children: <Widget>[Text(registry.hours)],
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              )),
        ),
      );
}
