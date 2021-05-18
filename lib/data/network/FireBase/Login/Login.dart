import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';

class Login{

  static LoginFunc(UserModel userModel, BuildContext context, GlobalKey<ScaffoldState> _scaffold) async{

    try{
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.email, password: userModel.pass);

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