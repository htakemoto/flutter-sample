import 'package:flutter/material.dart';
import '../../main.dart';
import './contact_detail.dart';
import '../../data/contact_data.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: ContactList(Contacts),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;
  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactList(context)
    );
  }

  List<_ContactListItem> _buildContactList(BuildContext context) {
    return _contacts.map((contact) => _ContactListItem(
      contact: contact,
      onTap: () { _showContactPage(context, contact); },))
    .toList();
  }

  void _showContactPage(BuildContext context, Contact contact) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) => ContactPage(contact),
      settings: RouteSettings(name: '/contact'),
    ));
  }
}

class _ContactListItem extends ListTile {
  _ContactListItem({
    @required Contact contact,
    @required GestureTapCallback onTap}) :
    super(
      title : Text(contact.fullName),
      subtitle: Text(contact.email),
      leading: CircleAvatar(
        child: Text(contact.fullName[0])
      ),
      onTap: onTap
    );
}
