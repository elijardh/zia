import 'package:flutter/material.dart';

class CatalogVM extends ChangeNotifier{
  int currIndex = 0;
  void update(int index){
    currIndex = index;
    notifyListeners();
  }
}