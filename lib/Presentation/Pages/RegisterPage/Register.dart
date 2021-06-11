import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/data/network/FireBase/Register/RegFire.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/text_field_underline.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController fullName = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void regUser() async {
    UserModel userModel = new UserModel(
      pass: password.value.text,
      email: email.value.text,
      fullName: fullName.text,
      phoneNumber: phoneNumber.text,
    );
    RegisterClass.register(userModel, _scaffoldKey, context);
/*    print(email.value.text);
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.value.text, password: password.value.text);
        FirebaseFirestore.instance.collection("users").doc().set(
          {"email": email.value.text, "phoneNumber": phoneNumber.value.text},);
        navigate(context, HomePage(name: email.text,));
      }
      catch(error){
        final snackBar = SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.blue,
          duration: Duration(
              seconds: 5
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        print(error.toString());
      }*/
  }

  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: config.sh(40),
                      width: config.sw(70),
                      decoration: BoxDecoration(
                        color: XColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: NormalText(
                          text: "1/2",
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                TitleText(
                  text: "Join Us!",
                  textColor: XColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                NormalText(
                  text:
                      "Spend reponsibly,(take that advice with a grain of salt)",
                  textColor: Colors.black.withOpacity(0.6),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YMargin(50),
                      NormalText(
                        text: "Full Name",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      YMargin(10),
                      EUnderLineButton(
                        controller: fullName,
                        hintText: "Full name",
                        hintTextColor: Colors.black,
                        fillColor: XColors.primaryColor.withOpacity(0.2),
                        enabledBorderColor: XColors.primaryColor,
                        focusedBorderColor: XColors.primaryColor,
                      ),
                      YMargin(50),
                      NormalText(
                        text: "Email Address",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      YMargin(10),
                      EUnderLineButton(
                        controller: email,
                        hintText: "Emial",
                        hintTextColor: Colors.black,
                        fillColor: XColors.primaryColor.withOpacity(0.2),
                        enabledBorderColor: XColors.primaryColor,
                        focusedBorderColor: XColors.primaryColor,
                        validator: (String val) {
                          EmailValiditor();
                        },
                      ),
                      YMargin(50),
                      NormalText(
                        text: "Password",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      YMargin(10),
                      EUnderLineButton(
                        obscureText: true,
                        controller: password,
                        hintText: "Password",
                        hintTextColor: Colors.black,
                        fillColor: XColors.primaryColor.withOpacity(0.2),
                        enabledBorderColor: XColors.primaryColor,
                        focusedBorderColor: XColors.primaryColor,
                        validator: (String val) {
                          PasswordValidiator();
                        },
                      ),
                      YMargin(50),
                      NormalText(
                        text: "Phone Number",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      YMargin(10),
                      EUnderLineButton(
                        controller: phoneNumber,
                        hintText: "Phone Number",
                        hintTextColor: Colors.black,
                        fillColor: XColors.primaryColor.withOpacity(0.2),
                        enabledBorderColor: XColors.primaryColor,
                        focusedBorderColor: XColors.primaryColor,
                      ),
                      YMargin(50),
                    ],
                  ),
                ),
                XButton(
                  onClick: () {
                    regUser();
                  },
                  text: "Register",
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                  buttonColor: XColors.primaryColor,
                  radius: 5,
                ),
                YMargin(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: "You are one of us?",
                      textColor: Colors.black.withOpacity(0.6),
                    ),
                    GestureDetector(
                      child: NormalText(
                        text: "Login",
                        textColor: XColors.primaryColor,
                      ),
                    )
                  ],
                ),
                YMargin(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
