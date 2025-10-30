import 'package:flutter/material.dart';

class Counter1Provider with ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}