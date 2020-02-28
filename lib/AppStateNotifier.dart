import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



  class AppStateNotifier extends ChangeNotifier{

    bool isDarkModeOn = false;

    void initState() {
      //super.initState();
      initisDarkMode();

    }

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