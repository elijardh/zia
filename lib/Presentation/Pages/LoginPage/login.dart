import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/ViewModel/login_vm/loginvm.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:provider/provider.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(80),
                  TitleText(
                    text: "Welcome Back",
                    textColor: Colors.black,
                    fontSize: 40,
                  ),
                  YMargin(10),
                  NormalText(
                    text:
                        "We’d say it’s good to have you back but why did you leave in the first place?",
                    maxLines: 3,
                    textColor: Colors.black.withOpacity(0.5),
                  ),
                  YMargin(60),
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
                    validator: (text) {
                      if (text.isEmpty) {
                        return "Type in an email";
                      }
                    },
                  ),
                  YMargin(40),
                  NormalText(
                    text: "Password",
                    textColor: Colors.black,
                  ),
                  EUnderLineButton(
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
                      obscureText: obscure,
                      controller: password,
                      hintText: "tt......",
                      hintTextColor: Colors.black,
                      fillColor: XColors.primaryColor.withOpacity(0.2),
                      enabledBorderColor: XColors.primaryColor,
                      focusedBorderColor: XColors.primaryColor,
                      validator: (String val) {
                        // Pattern pattern =
                        //     r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
                        // RegExp regex = RegExp(pattern);
                        if (val.isEmpty) {
                          return "Enter a password";
                        } else {
                          return null;
                        }
                      }),
                  YMargin(120),
                  XButton(
                    onClick: () {
                      if (_formKey.currentState.validate()) {
                        UserModel userModel = new UserModel(
                          phoneNumber: "",
                          fullName: "",
                          email: email.text,
                          pass: password.text,
                        );
                        context.read<LoginVM>().loginVM(userModel, context);
                      }
                    },
                    isLoading: context.watch<LoginVM>().log,
                    text: "Login",
                    textColor: Colors.white,
                    buttonColor: XColors.primaryColor,
                    radius: 5,
                    progressColor: Colors.white,
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
      ),
    );
  }
}
