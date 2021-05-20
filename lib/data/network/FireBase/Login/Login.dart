import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/utils/navigator.dart';

class Login{

  static loginFunc(UserModel userModel, BuildContext context, GlobalKey<ScaffoldState> _scaffold) async{

    try{
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.email, password: userModel.pass);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("email", userModel.email);
      navigate(context, HomePage(
        name: userModel.fullName,
      ));

    }
    on FirebaseAuthException catch(error){
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