import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItem{
  String itemName;
  int itemPrice;
  int itemQuantity;
  DocumentReference itemRef;

  OrderItem({this.itemName,this.itemPrice,this.itemQuantity,this.itemRef});
}