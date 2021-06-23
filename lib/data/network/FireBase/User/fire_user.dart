import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zia/Domain/user_Model.dart';

Future<UserModel> getUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var user = auth.currentUser;
  var tempHolder =
      await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
      

  if (tempHolder.get("email") != null) {
    print(tempHolder.get("email"));
    UserModel model = UserModel(
      email: tempHolder.get("email").toString(),
      fullName: tempHolder.get("fullname").toString(),
      phoneNumber: tempHolder.get("phoneNumber").toString(),
    );
    print(model.fullName);
    return model;
  }
}
