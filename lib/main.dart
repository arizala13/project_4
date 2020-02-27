import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppStateNotifier.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      builder: (context) => AppStateNotifier(),
      child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier> (
      builder: (context, appState, child){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: ThemeDemo(),
      );
      },
    );
  }
}

class ThemeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeDemoState();
}

class ThemeDemoState extends State<ThemeDemo>{


bool val = false;

makeDarkMode(bool makeDark){
  setState(() {
    val = makeDark;    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!', style: Theme.of(context).textTheme.title,)
        ),
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book,
              color: Theme.of(context).iconTheme.color,
              size: 36.0,
              ),
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
                          title: Text('Dark Mode?', style: Theme.of(context).textTheme.title),
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

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    appBarTheme: AppBarTheme(

      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.black,
        )
    )
  );

    static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      title: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
        color: Colors.white,
        ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
        )
    )

  );

}