import 'package:flutter/material.dart';
import '../../data/contact_data.dart';

class ContactPage extends StatelessWidget {
  final Contact _contact;
  ContactPage(this._contact);

  @override
  Widget build(BuildContext context) {
    Text title = Text("Contact Detail");

    Widget nameSection = Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        _contact.fullName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget emailSection = Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(_contact.email),
    );

    Widget descSection = Container(
      padding: EdgeInsets.only(bottom: 16),
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
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget backButton = RaisedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Go back!'),
    );

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          nameSection,
          emailSection,
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
