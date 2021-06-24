import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Color getColor(var status){

  switch(status){

    case "PENDING":{
      return Colors.grey;
    }
    break;
    case "CANCELLED" :{
      return Colors.red;
    }
    break;
    case "COMPLETED" :{
      return Colors.green;
    }
    break;
    case "PROGRESS":{
      return Colors.yellow;
    }
  }

}

List<DocumentReference> getRef(List<QueryDocumentSnapshot> snapshot){
  List<DocumentReference> list= [];
  for(int i = 0; i<snapshot.length; i++){
    list.add(snapshot[i].reference);
  }
  return list;
}