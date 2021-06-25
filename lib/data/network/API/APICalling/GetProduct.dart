import 'dart:convert';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/data/network/API/API%20Url/Urls.dart';
import 'package:http/http.dart' as http;

Future<ProductList> getCatList(String category) async {
  ProductList productList = new ProductList();
  String url = Urls.categoryLink + category;
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    productList = ProductList.fromJson(json.decode(response.body as dynamic));
    print(productList.list[0].price);
    return productList;
  } else {
    throw Exception("Error");
  }
}
