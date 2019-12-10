import 'package:flutter/material.dart';
import '../../main.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Events Page'),
      ),
    );
  }
}