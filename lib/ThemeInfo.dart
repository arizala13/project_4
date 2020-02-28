import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: AppBarTheme(

      color: Colors.blueGrey,
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