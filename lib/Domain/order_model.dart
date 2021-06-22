import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zia/Domain/order_items.dart';

class OrderModel{
  int totalCost;
  bool status;
  DocumentReference buyerID;
  List<OrderItem> items;
  OrderModel({this.buyerID,this.items,this.totalCost,this.status});

  toJson(List<OrderItem> test){
    List<dynamic> json = [];
    for(int i = 0;i<test.length;i++){
      var temp = test[i].toJson();
      json.add(temp);
    }
    return json;
  }
}