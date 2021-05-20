import 'package:firebase_auth/firebase_auth.dart';

class FireUser{
  final FirebaseAuth auth = FirebaseAuth.instance;
  User getUser(){
    var user  = auth.currentUser;
    return user;
  }
}