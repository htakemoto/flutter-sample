import 'package:flutter/material.dart';
import '../../main.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.tag_faces,),),
              Tab(icon: Icon(Icons.credit_card,),),
              Tab(icon: Icon(Icons.info,),),
            ],
          ),
          actions: <Widget>[
            NewsActionButton(),
          ],
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            TabWidget(Colors.yellow),
            TabWidget(Colors.orange),
            TabWidget(Colors.red),
          ]
        ),
      )
    );
  }
}

class TabWidget extends StatelessWidget {
  final Color color;

  TabWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}