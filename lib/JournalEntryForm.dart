import 'package:flutter/material.dart';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm>{

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: formKey,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Title', border: OutlineInputBorder() 
                ),
                onSaved: (value) {
                  // Store in some object 
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              new TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Body', border: OutlineInputBorder() 
                ),
                onSaved: (value) {
                  // Store in some object 
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Body';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
        new TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Rating', border: OutlineInputBorder() 
                ),
                onSaved: (value) {
                  // Store in some object 
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a Rating';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save Entry'),
                ),
        ],
      ),
      )
      );
  }
}