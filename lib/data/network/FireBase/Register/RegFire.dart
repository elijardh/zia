import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/utils/navigator.dart';

class RegisterClass {
  static register(UserModel user, GlobalKey<ScaffoldState> _scaffold, BuildContext context) async{
    try{
      UserCredential regUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.pass,);
      FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection("users").doc(regUser.user.uid).set(
        {"email": user.email, "phoneNumber": user.phoneNumber},);
      navigate(context, HomePage(name: user.email,));
    }
    catch(error){
      final snackBar = SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.blue,
        duration: Duration(
            seconds: 5
        ),
      );
      _scaffold.currentState.showSnackBar(snackBar);
    }

  }
}