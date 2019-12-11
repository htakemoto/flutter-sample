import 'package:flutter/material.dart';
import '../../data/contact_data.dart';

class ContactPage extends StatelessWidget {
  final Contact _contact;
  ContactPage(this._contact);

  @override
  Widget build(BuildContext context) {
    Text title = Text("Contact Detail");

    Widget profileSection = Container(
      padding: EdgeInsets.symmetric(vertical: 64.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.9],
          colors: [
            Colors.blue[700],
            Colors.blue[600],
            Colors.blue[500],
          ],
        )
      ),
      child: Column(
        children: <Widget>[
          Text(
            _contact.fullName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _contact.email,
            style: TextStyle(
              height: 2.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    Widget descSection = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget backButton = Container(
      padding: EdgeInsets.all(20),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go back!'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: ListView(
        children: [
          profileSection,
          descSection,
          buttonSection,
          backButton,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
