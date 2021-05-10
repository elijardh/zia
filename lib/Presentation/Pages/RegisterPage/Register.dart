import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
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

  FocusNode _fullName = new FocusNode();

  FocusNode _email = new FocusNode();
  FocusNode _password = new FocusNode();
  FocusNode _phoneNumber = new FocusNode();

  final GlobalKey<FormState> _formKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      YMargin(50),
                      SizedBox(child: Image.asset("assets/images/zia.png"),
                      height: 100,
                      ),
                      YMargin(50),
                      MkInputField(
                        controller: fullName,
                        borderColor: XColors.primaryColor,
                        fillColor: Colors.white,
                        //hint: "Full Name",
                        currentNode: _fullName,
                        label: "Full Name",
                        labelColor: XColors.primaryColor,
                        preffixIcon: Icon(Icons.account_circle_outlined),
                      ),
                      YMargin(50),
                      MkInputField(
                        controller: email,
                        borderColor: XColors.primaryColor,
                        fillColor: Colors.white,
                        //hint: "Full Name",
                        currentNode: _email,
                        label: "Email",
                        labelColor: XColors.primaryColor,
                        preffixIcon: Icon(Icons.mail_outline),

                      ),
                      YMargin(50),
                      MkInputField(
                        controller: password,
                        borderColor: XColors.primaryColor,
                        fillColor: Colors.white,
                        //hint: "Full Name",
                        currentNode: _password,
                        label: "Password",
                        labelColor: XColors.primaryColor,
                        preffixIcon: Icon(Icons.wb_iridescent),
                      ),
                      YMargin(50),
                      MkInputField(
                        controller: phoneNumber,
                        borderColor: XColors.primaryColor,
                        fillColor: Colors.white,
                        //hint: "Full Name",
                        currentNode: _phoneNumber,
                        label: "Phone Number",
                        labelColor: XColors.primaryColor,
                        preffixIcon: Icon(Icons.phone),
                      ),
                      YMargin(50),
                    ],
                  ),
                ),
                XButton(
                  text: "Register",
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black,
                  buttonColor: XColors.primaryColor,
                  radius: 10,
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
