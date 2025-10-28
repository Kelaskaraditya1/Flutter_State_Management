import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier{

  ThemeMode theme = ThemeMode.system;
  Icon themeIcon = Icon(Icons.light_mode);
  

  void changeTheme(ThemeMode value){
    theme=value;
    value == ThemeMode.dark? themeIcon = Icon(Icons.dark_mode):
        themeIcon = Icon(Icons.light_mode);
    notifyListeners();
  }

}