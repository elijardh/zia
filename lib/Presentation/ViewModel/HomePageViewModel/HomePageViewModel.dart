import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/data/network/API/APICalling/GetProduct.dart';

class HomePageViewModel extends ChangeNotifier {
  ProductList pList = ProductList(list: []);
  bool error = false;

  getList(String category) async {
    try {
      pList = await getCatList(category);
      print("${pList.list[0].price} hello");
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
