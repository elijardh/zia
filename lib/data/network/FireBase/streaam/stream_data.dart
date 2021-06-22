import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';

Stream<QuerySnapshot> streamData() async* {
  var snapshot = FirebaseFirestore.instance
      .collection("products")
      .where("category", isEqualTo: "Electronics")
      .snapshots();

  //yield snapshot;
}
