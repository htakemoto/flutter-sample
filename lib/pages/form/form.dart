import 'package:flutter/material.dart';
import '../../main.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        actions: <Widget>[
          NewsActionButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<_MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final usernameFocus = FocusNode();
  final emailFocus = FocusNode();

  var _username = '';
  var _email = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              focusNode: usernameFocus,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Enter your username'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(emailFocus);
              },
              onSaved: (value) {
                _updateUsername(value);
              },
            ),
            TextFormField(
              focusNode: emailFocus,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                hintText: 'xxxx@sample.com'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onFieldSubmitted: (v) {
                emailFocus.unfocus();
              },
              onSaved: (value) {
                _updateEmail(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlatButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // invoke onSaved()
                    _formKey.currentState.save();
                    
                    showDialog<int>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Username: $_username'),
                                Text('Email: $_email'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(0),
                              child: Text('Cancel'),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(1),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Submit'),
                textColor: Colors.white,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUsername(String username) {
    setState(() {
      _username = username;
    });
  }

  void _updateEmail(String email) {
    setState(() {
      _email = email;
    });
  }
}
