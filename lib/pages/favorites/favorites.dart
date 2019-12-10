import 'package:flutter/material.dart';
import '../../main.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoritesState();
  }
}

class _FavoritesState extends State<FavoritesPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Item1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Item2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Item3')
          )
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    }); 
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}