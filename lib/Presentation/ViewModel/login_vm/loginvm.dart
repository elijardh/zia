import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/data/network/FireBase/Login/Login.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/widgets/texts.dart';

class LoginVM extends ChangeNotifier {

  bool log;

  Future loginVM(UserModel userModel, BuildContext context) async {

    log = true;
    notifyListeners();
    loginFunc(userModel).then((value) {
      log = false;
      notifyListeners();
      navigate(context, HomePage());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: NormalText(
        text: "Login succesfull",
        textColor: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: XColors.primaryColor,
      ));
    }).catchError((e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: NormalText(
        text: e.toString(),
        textColor: Colors.white,
        fontWeight: FontWeight.bold,
      ),
        backgroundColor: XColors.primaryColor,
      ));
    });

  }
}

enum loginStatus { LOADING, SUCCESSFUL, FAILED }
