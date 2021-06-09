import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/data/network/FireBase/Login/Login.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey();

  login() {
    UserModel userModel = new UserModel(
      phoneNumber: "",
      fullName: "",
      email: email.text,
      pass: password.text,
    );
    Login.loginFunc(userModel, context, _scaffold);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffold,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(100),
                TitleText(
                  text: "Welcome Back",
                  textColor: XColors.primaryColor,
                ),
                NormalText(
                  text:
                      "We’d say it’s good to have you back but why did you leave in the first place?",
                  maxLines: 3,
                  textColor: XColors.primaryColor,
                ),
                YMargin(40),
                NormalText(
                  text: "Email Address",
                  textColor: Colors.black,
                ),
                EUnderLineButton(
                  controller: email,
                  obscureText: false,
                  hintText: "your email",
                  hintTextColor: Colors.black,
                  fillColor: XColors.primaryColor.withOpacity(0.2),
                  enabledBorderColor: XColors.primaryColor,
                  focusedBorderColor: XColors.primaryColor,
                ),
                YMargin(40),
                NormalText(
                  text: "Password",
                  textColor: Colors.black,
                ),
                EUnderLineButton(
                  obscureText: true,
                  controller: password,
                  hintText: "tt......",
                  hintTextColor: Colors.black,
                  fillColor: XColors.primaryColor.withOpacity(0.2),
                  enabledBorderColor: XColors.primaryColor,
                  focusedBorderColor: XColors.primaryColor,
                  validator: (String val) {
                    PasswordValidiator();
                  },
                ),
                YMargin(150),
                XButton(
                  onClick: () {
                    login();
                  },
                  text: "Login",
                  textColor: Colors.white,
                  buttonColor: XColors.primaryColor,
                  radius: 10,
                  width: SizeConfig.screenWidthDp,
                ),
                YMargin(20),
                Row(
                  children: [
                    NormalText(
                      text: "You're new? Ewww. Go ",
                      textColor: Colors.white,
                    ),
                    GestureDetector(
                      child: NormalText(
                        text: "Sign Up ",
                        textColor: XColors.primaryColor,
                      ),
                    ),
                    NormalText(
                      text: "quick",
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
