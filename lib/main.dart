import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(title: 'Welcome!'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

bool val = false;

makeDarkMode(bool makeDark){
  setState(() {
    val = makeDark; 
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome!')),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              color: Colors.black54,
              size: 36.0,
              ),
          ],
        ),),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
               height : 50.0, 
              child: DrawerHeader(
                child: Text('Settings'),
                decoration: new BoxDecoration(color: Colors.grey),
              ),
            ),
            Center(
              child: SwitchListTile(
                title: Text('Dark Mode'),
                value: val,
                onChanged: (makeDark) {
                  makeDarkMode(makeDark);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  void testing(){
  print('dark mode tapped!');
  }
}