import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseModel {
  String category;
  String description;
  String id;
  String image;
  String price;
  String amount;
  String title;

  FireBaseModel(
      {this.title,
      this.id,
      this.price,
      this.image,
      this.description,
      this.category,
      this.amount});

  FireBaseModel.fromSnapshot(QueryDocumentSnapshot snapshot)
      : id = snapshot.id,
        category = snapshot["category"],
        price = snapshot["price"],
        description = snapshot["description"],
        title = snapshot["name"],
        image = snapshot["image"],
        amount = snapshot["amount"];
}
