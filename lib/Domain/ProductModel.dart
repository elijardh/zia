import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String category;
  String description;
  Object id;
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

  ProductModel.fromSnapshot(QueryDocumentSnapshot snapshot)
      : id = snapshot.id,
        category = snapshot["category"],
        price = snapshot["price"] is double
            ? (snapshot['price'] as double).toInt()
            : snapshot['price'] as int,
        description = snapshot["description"],
        title = snapshot["name"],
        image = snapshot["image"];

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
