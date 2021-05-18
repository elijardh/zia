import 'ProductModel.dart';

class ProductList{
  final List<ProductModel> list;

  ProductList({this.list});

  factory ProductList.fromJson(List<dynamic> json){
    List<ProductModel> model = new List<ProductModel>();
    model = json.map((i) => ProductModel.fromJson(i)).toList();
    return new ProductList(
      list: model,
    );
  }
}

