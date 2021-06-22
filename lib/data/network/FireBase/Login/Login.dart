import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/utils/navigator.dart';

Future loginFunc(
  UserModel userModel,
) async {
  try {
    var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.pass);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", userModel.email);
  } catch (error) {
    throw Exception(error);
  }
}
