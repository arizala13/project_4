import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



  class AppStateNotifier extends ChangeNotifier{

    bool isDarkModeOn = false;

    void initisDarkMode() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      isDarkModeOn = prefs.getBool('isDarkModeOn');
    }


    void updateTheme(bool isDarkModeOn) async {
      this.isDarkModeOn = isDarkModeOn;
      notifyListeners();
      
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeOn', isDarkModeOn);
    }

  }

// class DarkThemePreference {
//   static const THEME_STATUS = "THEMESTATUS";

//   initisDarkMode(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(THEME_STATUS, value);
//   }

//   Future<bool> getTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(THEME_STATUS) ?? false;
//   }
// }


// class AppStateNotifier with ChangeNotifier {
//   DarkThemePreference darkThemePreference = DarkThemePreference();
//   bool isDarkModeOn = false;

//   bool get darkTheme => isDarkModeOn;

//   void updateTheme(bool value) {
//     isDarkModeOn = value;
//     darkThemePreference.initisDarkMode(value);
//     notifyListeners();
//   }
// }