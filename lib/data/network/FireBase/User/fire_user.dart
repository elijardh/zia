import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zia/Domain/user_Model.dart';

class FireUser{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<UserModel> getUser() async{
    var user  = auth.currentUser;
    var tempHolder = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
    if(tempHolder.get("email") != null){
      print(tempHolder.get("email"));
      UserModel model = UserModel(
        email: tempHolder.get("email").toString(),
        fullName: tempHolder.get("fullname").toString(),
        phoneNumber: tempHolder.get("phoneNumber").toString(),
      );
      print(model.fullName);
      return model;
    }
   /* FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: user.email)
        .limit(1)
        .get().then((value) {
      if(value.docs.length > 0){
        Map<String, dynamic> name = value.docs[0].data();
        String hell = name["email"];
        return hell;
      }
    });*/
  }
}