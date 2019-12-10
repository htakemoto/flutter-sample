import 'package:flutter/material.dart';
import '../../main.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}