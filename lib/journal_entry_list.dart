import 'package:flutter/material.dart';
import 'package:project_4/JournalEntryForm.dart';
import 'package:sqflite/sqflite.dart';


class JournalEntryListScreen extends StatefulWidget {

}

  class _JournalEntryScreenState extends State<JournalEntryListScreen> {
  
  Journal journal;
  
  @override
  void initState(){
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    
    final Database database = await openDatabase(
      'journal.db', version: 1, onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
          }
      );
    List<Map> journalRecords = await database.rawQuery('SELECT * FROM journal_entries');
  final journalEntries = journalRecords.map( (record) {
    return JournalEntry(
    title: record['titile'],
    body: record['body'],
    rating: record['rating'],
    dateTime: DateTime.parse(record['date']));
  }).toList();
  print(journalEntries);

  setState(() {
    journal = Journal(entries: journalEntries);
  });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return JournalScaffold(
        title: 'Loading',
        child: Center(child: CircularProgressIndicator())
      );
    } else {
      title: journal.isEmpty ? 'Welcome' : 'Journal Entries',
      child: journal.isEmpty ? Welcome() : journalList(context),
      fab: addEntryFab(context)
      );
    }
  }


  }