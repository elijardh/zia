import 'package:firebase_database/firebase_database.dart';

class ProductModel {
  String category;
  String description;
  int id;
  String image;
  Object price;
  String title;

  ProductModel(
      {this.category,
      this.description,
      this.id,
      this.image,
      this.price,
      this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json['category'],
      description: json['description'],
      id: json['id'],
      image: json['image'],
      price: json['price'] is double
          ? (json['price'] as double).toInt()
          : json['price'] as int,
      title: json['title'],
    );
  }

  ProductModel.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key as int,
        category = snapshot.value["category"],
        price = snapshot.value["price"] as Object,
        description = snapshot.value["description"],
        title = snapshot.value["title"],
        image = snapshot.value["image"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}
