import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{
  int counter =0;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}