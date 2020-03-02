import 'package:flutter/material.dart';
import 'package:project_4/JournalEntryForm.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'AppStateNotifier.dart';
import 'JournalEntryForm.dart';


class JournalEntriesScreen extends StatelessWidget {

  static const routeKey = 'journal_entries';

  final items = List<Map>.generate(10000, (i) {
    return {
      'title': 'Journal Entry $i',
      'subtitle': 'Subtitle text for $i',
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( context,
    MaterialPageRoute(builder: (context) => JournalEntryForm()),
    );
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).appBarTheme.color,
    ),
      appBar:AppBar (title: Text('Journal Entries'),) ,
      body: ListView.builder( itemBuilder: (context, index) {
        return ListTile(
            leading:  FlutterLogo(),
            trailing: Icon(Icons.more_vert),
            title: Text('Journal Entry ${items[index]['title']}', style:(Theme.of(context).textTheme.title)),
            subtitle: Text('Example ${items[index]['subtitle']}', style:(Theme.of(context).textTheme.title)),
            );
      })
    );
  }
}


// class JournalEntryList extends StatefulWidget {
//   @override
//   _JournalEntryListState createState() => _JournalEntryListState();
//   }

// class _JournalEntryListState extends State<JournalEntryList>{  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push( context,
//     MaterialPageRoute(builder: (context) => JournalEntryList()),
//     );
//       },
//       child: Icon(Icons.add),
//       backgroundColor: Theme.of(context).appBarTheme.color,
//     ),
//       appBar: AppBar(
//         title: Text('Journal entries', style: Theme.of(context).textTheme.title,)
//         ),
//       body: Center(child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//           ],
//         ),),
//       endDrawer: Drawer(
//           child: Container(
//             color: Theme.of(context).appBarTheme.color,
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                   child: SizedBox(
//                      height : 100.0, 
//                     child: DrawerHeader(
//                       child: Text('Settings', style: Theme.of(context).textTheme.title),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Center(
//                     child: Container(
//                       child: Container(
//                         child: SwitchListTile(
//                           title: Text('Dark Mode', style: Theme.of(context).textTheme.title),
//                           value: Provider.of<AppStateNotifier>(context).isDarkModeOn,
//                           onChanged: (boolVal) {
//                             Provider.of<AppStateNotifier>(context).updateTheme(boolVal);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }


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