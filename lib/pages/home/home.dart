import 'package:flutter/material.dart';
import '../../main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(child: Text('Welcome Home')),
    );
  }
}