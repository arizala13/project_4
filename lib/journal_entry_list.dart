import 'package:flutter/material.dart';
import 'package:project_4/JournalEntryForm.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'AppStateNotifier.dart';
import 'JournalEntryForm.dart';


class JournalEntryList extends StatefulWidget {
  @override
  _JournalEntryListState createState() => _JournalEntryListState();
  }

class _JournalEntryListState extends State<JournalEntryList>{  

  bool isDarkModeOn = false;

  void initState() {
    super.initState();
    isDarkModeOn = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( context,
    MaterialPageRoute(builder: (context) => JournalEntryList()),
    );
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).appBarTheme.color,
    ),
      appBar: AppBar(
        title: Text('HERE SHOULD BE JOURNAL ENTRIES', style: Theme.of(context).textTheme.title,)
        ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              color: Theme.of(context).iconTheme.color,
              size: 100.0,
              ),
              Text('Journal', style: Theme.of(context).textTheme.title),
          ],
        ),),
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
}


// class JournalEntryListScreen extends StatefulWidget {

// }

//   class _JournalEntryScreenState extends State<JournalEntryListScreen> {
  
//   Journal journal;
  
//   @override
//   void initState(){
//     super.initState();
//     loadJournal();
//   }

//   void loadJournal() async {
    
//     final Database database = await openDatabase(
//       'journal.db', version: 1, onCreate: (Database db, int version) async {
//         await db.execute(
//           'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)');
//           }
//       );
//     List<Map> journalRecords = await database.rawQuery('SELECT * FROM journal_entries');
//   final journalEntries = journalRecords.map( (record) {
//     return JournalEntry(
//     title: record['titile'],
//     body: record['body'],
//     rating: record['rating'],
//     dateTime: DateTime.parse(record['date']));
//   }).toList();
//   print(journalEntries);

//   setState(() {
//     journal = Journal(entries: journalEntries);
//   });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (journal == null) {
//       return JournalScaffold(
//         title: 'Loading',
//         child: Center(child: CircularProgressIndicator())
//       );
//     } else {
//       title: journal.isEmpty ? 'Welcome' : 'Journal Entries',
//       child: journal.isEmpty ? Welcome() : journalList(context),
//       fab: addEntryFab(context);
//     }
//   }


//   }