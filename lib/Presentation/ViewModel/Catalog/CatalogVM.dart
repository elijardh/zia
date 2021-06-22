import 'package:flutter/material.dart';

class CatalogVM extends ChangeNotifier {
  int currIndex = 0;
  String cat = "Electronics";

  updateString(String cate) {
    print(cate);
    cat = cate;
    notifyListeners();
  }

  void update(int index) {
    currIndex = index;
    notifyListeners();
  }
}
