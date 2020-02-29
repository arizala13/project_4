import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'AppStateNotifier.dart';

class JournalEntryFields {
  String title;
  String body;
  //String dateTime = DateTime.now().toString();
  String dateTime;
  String rating;
  String toString() {
    return 'Title: $title, Body: $body, Ratings: $rating, DateTime: $dateTime';
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
        return Scaffold(
      appBar: AppBar(
        title: Text('New Journal Entry', style: Theme.of(context).textTheme.title,)
        ),
      body: Center(child: Container(
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
                      journalEntryFields.title = value;
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
                      journalEntryFields.body = value; 
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
                      journalEntryFields.rating = value; 
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
                    onPressed: () async{
                      if (formKey.currentState.validate()) {
                        print('HERE WE 1....');
                        formKey.currentState.save();
                        addDateToJournalEntryValues();
                        //await deleteDatabase('journal.db');

                        print('HERE WE 2....');

                        final Database database = await openDatabase(
                          'journal.db', version: 1, onCreate: (Database db, int version) async {
                            await db.execute(
                            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
                          }
                          );

                        await database.transaction( (txn) async {
                          await txn.rawInsert('INSERT INTO journal_entries(title, body, date, rating) VALUES(?, ?, ?, ?)',
                          [journalEntryFields.title, journalEntryFields.body, journalEntryFields.dateTime, journalEntryFields.rating],
                          );
                        }); 

                        await database.close();
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
                ),
      endDrawer: Drawer(
          child: Container(
            color: Theme.of(context).appBarTheme.color,
            child: ListView(
              children: <Widget>[
                Container(
                  child: SizedBox(
                     height : 100.0, 
                    child: DrawerHeader(
                      child: Text('Settings', style: Theme.of(context).textTheme.title),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      child: Container(
                        child: SwitchListTile(
                          title: Text('Dark Mode', style: Theme.of(context).textTheme.title),
                          value: Provider.of<AppStateNotifier>(context).isDarkModeOn,
                          onChanged: (boolVal) {
                            Provider.of<AppStateNotifier>(context).updateTheme(boolVal);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void addDateToJournalEntryValues() {
    //journalEntryFields.dateTime = DateTime.now() as String;
    journalEntryFields.dateTime = 'help';
  }


}