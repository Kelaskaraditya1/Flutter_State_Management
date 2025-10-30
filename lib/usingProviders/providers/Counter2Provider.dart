import 'package:flutter/material.dart';

class Counter2Provider with ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter+=2;
    notifyListeners();
  }
}