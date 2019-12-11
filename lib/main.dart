import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/news/news.dart';
import 'pages/events/events.dart';
import 'pages/favorites/favorites.dart';
import 'pages/contacts/contact_list.dart';
import 'pages/form/form.dart';
import 'pages/settings/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => HomePage(),
        '/favorites': (BuildContext context) => FavoritesPage(),
        '/events': (BuildContext context) => EventsPage(),
        '/contacts': (BuildContext context) => ContactsPage(),
        '/form': (BuildContext context) => FormPage(),
        '/settings': (BuildContext context) => SettingsPage()
      },
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Steve Jobs'),
            accountEmail: Text('sjobs@apple.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('SJ'),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/account-bg.jpg'),
                fit: BoxFit.fill,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text('Events'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/events');
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contacts');
            },
          ),
          ListTile(
            leading: Icon(Icons.comment),
            title: Text('Form'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/form');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}

class NewsActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return NewsPage();
            },
            fullscreenDialog: true
          )
        );
      },
    );
  }
}