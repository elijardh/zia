import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/data/network/FireBase/Register/RegFire.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

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
  }

  bool obscure = true;

  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  YMargin(10),
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
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Input a name";
                            }
                            return null;
                          },
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
                          hintText: "Email",
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
                          obscureText: obscure,
                          suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                                color: Colors.black.withOpacity(0.5),
                              )),
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
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Input a phone number";
                            }
                            return null;
                          },
                        ),
                        YMargin(50),
                      ],
                    ),
                  ),
                  XButton(
                    onClick: () {
                      if (_formKey.currentState.validate()) {
                        regUser();
                      }
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
      ),
    );
  }
}
