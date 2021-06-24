import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/cartModel.dart';
import 'package:zia/Domain/order_items.dart';
import 'package:zia/Domain/order_model.dart';
import 'package:zia/data/local/database/database.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/texts.dart';

class CartVM extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<CartModel> listModels = [];
  int totalCost = 0;

  addToList(BuildContext context) async {
    DatabaseProvider.instance.getCart().then((value) {
      if (value.isNotEmpty) {
        listModels = value;
        print(listModels[0].name);
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: NormalText(
          text: error.toString(),
          fontWeight: FontWeight.bold,
          textColor: XColors.primaryColor,
        ),
        backgroundColor: Colors.white,
      ));
    });
  }

  Future deleteFromList(int id, int index) async {
    DatabaseProvider.instance.deleteCart(id).then((value) {
      listModels.removeAt(index);
      notifyListeners();
    }).catchError((e) {
      print(e.toString());
    });
  }

  void getTotalCost() {
    totalCost = 0;
    for (int i = 0; i < listModels.length; i++) {
      totalCost = totalCost + (listModels[i].price * listModels[i].amount);
    }
  }

  increaseAmount(int index) {
    listModels[index].amount++;
    getTotalCost();
    notifyListeners();
  }

  decreasesAmount(int index) {
    listModels[index].amount--;
    getTotalCost();
    notifyListeners();
  }

  placeOrder(BuildContext context) async {
    var user = auth.currentUser;
    List<OrderItem> items = [];

    for (int i = 0; i < listModels.length; i++) {
      OrderItem item = OrderItem(
          itemName: listModels[i].name,
          itemPrice: listModels[i].price,
          itemQuantity: listModels[i].amount,
          itemRef: FirebaseFirestore.instance
              .doc("products/${listModels[i].objID}"));
      items.add(item);
    }
    OrderModel model = OrderModel(
        buyerID: FirebaseFirestore.instance.collection("users").doc(user.uid),
        totalCost: totalCost,
        items: items,
        status: "PENDING");
    print(model.items[0].itemRef);
    FirebaseFirestore.instance
        .collection("orders")
        .doc()
        .set(
        {
          "buyerID": model.buyerID,
          "totalCost": model.totalCost,
          "items": model.toJson(model.items),
          "status": model.status
        })
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "OrderPlaced",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: XColors.primaryColor,
      ));
    }).onError((error, stackTrace) {
      print(stackTrace.toString());
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.toString() + "${model.items[0].itemRef}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: XColors.primaryColor,
      ));
    });
  }
}
