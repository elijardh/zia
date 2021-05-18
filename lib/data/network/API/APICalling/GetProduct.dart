import 'dart:convert';

import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/data/network/API/API%20Url/Urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GetProducts{
  Future<ProductList> getList(String category) async{
    var url = Urls.categoryLink+category;
    var response = await http.get(url);
    if(response.statusCode == 200){
      ProductList productList = ProductList.fromJson(json.decode(response.body));
      return productList;
    }
  }

}