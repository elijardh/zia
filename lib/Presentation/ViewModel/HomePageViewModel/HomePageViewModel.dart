import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/data/network/API/APICalling/GetProduct.dart';

class HomePageViewModel extends ChangeNotifier{
  ProductList pList;
  getList(String category) async{
    GetProducts getProducts = new GetProducts();
    pList = await getProducts.getList(category);
    print(pList.list[0].title.toString() + "hello");
    notifyListeners();
  }
}