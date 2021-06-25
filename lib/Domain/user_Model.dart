import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String pass;
  final String fullName;
  final String phoneNumber;
  UserModel({this.email, this.fullName, this.pass, this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      fullName: json["fullname"],
      pass: "",
      phoneNumber: json["phoneNumber"],
    );
  }
  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : email = snapshot["email"],
        fullName = snapshot["fullname"],
        pass = "",
        phoneNumber = snapshot["phoneNumber"];
}
