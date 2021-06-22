import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class OrderItem{
  String itemName;
  int itemPrice;
  int itemQuantity;
  DocumentReference itemRef;

  OrderItem({this.itemName,this.itemPrice,this.itemQuantity,this.itemRef});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();
    data["itemName"] = this.itemName;
    data["itemPrice"] = this.itemPrice;
    data["itemQuantity"] = this.itemQuantity;
    data["itemRef"] = this.itemRef;
    return data;
  }

  factory OrderItem.fromJson(Map<String, dynamic> json){
    return OrderItem(
      itemQuantity: json["itemQuantity"],
      itemPrice: json["itemPrice"],
      itemName: json["itemName"],
      itemRef: json["itemRef"],
    );
  }

}

class OrderItemList{
  List<OrderItem> items;
  OrderItemList({this.items});

  factory  OrderItemList.fromList(List<dynamic> json){
    List<OrderItem> list = [];
    list = json.map((m) => OrderItem.fromJson(m)).toList();
    return OrderItemList(
      items: list
    );
  }
}