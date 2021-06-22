import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zia/Domain/order_items.dart';

class OrderModel{
  int totalCost;
  bool status;
  DocumentReference buyerID;
  List<OrderItem> items;
  OrderModel({this.buyerID,this.items,this.totalCost,this.status});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["totalCost"] = this.totalCost;
    data["status"] = this.status;
    data["buyerID"] = this.buyerID;
    data["items"] = this.items;
    return data;
  }
}