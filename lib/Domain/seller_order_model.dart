import 'package:cloud_firestore/cloud_firestore.dart';

import 'order_items.dart';

class SellerOrderModel{
  DocumentReference buyer;
  OrderItemList items;
  String status;
  int totalCost;
  SellerOrderModel({this.items,this.status,this.totalCost,this.buyer});

  SellerOrderModel.fromSnapShot(QueryDocumentSnapshot snapshot):
      buyer = snapshot["buyerID"],
      status = snapshot["status"],
      items = OrderItemList.fromList(snapshot["items"]),
      totalCost = snapshot ["totalCost"];
}