import 'package:flutter/material.dart';

class Counter3Provider with ChangeNotifier{
  int counter = 0;

  void incrementCounter(){
    counter+=3;
    notifyListeners();
  }
}