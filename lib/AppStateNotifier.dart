import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//TODO: I need to update this to make it work correctly with shared prefrences 
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