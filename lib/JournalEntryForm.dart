import 'package:flutter/material.dart';

class JournalEntryFields {
  String title;
  String body;
  DateTime dateTime;
  int rating;
  String toString() {
    return 'Title $title, Body $body, Time: $dateTime, Ratings: $rating';
  }
}

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm>{

  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Form(
          key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
            children: [
              new TextFormField(
                  autofocus: true,
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  decoration: InputDecoration(
                     labelStyle: Theme.of(context).textTheme.title,
                    labelText: 'Title', border: OutlineInputBorder(),
                      
                    ),
                    onSaved: (value) {
                      //journalEntryFields.title = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a Title';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  new TextFormField(
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.title,
                    labelText: 'Body', border: OutlineInputBorder(),
                    ),
                    onSaved: (value) {
                      //journalEntryFields.body = value; 
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
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.title,
                    labelText: 'Rating', border: OutlineInputBorder(), 
                    ),
                    onSaved: (value) {
                      //journalEntryFields.rating = value as int; 
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
                        //Database.of(context).saveJournalEntry(journalEntryFields);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Save Entry'),
                    ),
          ],
        ),
                ),
        ),
      )
      );
  }
}