import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/text_field_underline.dart';
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

  FocusNode _fullName = new FocusNode();

  FocusNode _email = new FocusNode();
  FocusNode _password = new FocusNode();
  FocusNode _phoneNumber = new FocusNode();

  final GlobalKey<FormState> _formKey = new GlobalKey();

  void regUser() async{
    Firebase.initializeApp();
    print(email.value.text);
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.value.text, password: password.value.text);
        FirebaseFirestore.instance.collection("users").doc().set(
          {"email": email.value.text, "phoneNumber": phoneNumber.value.text},);
      }
      catch(error){
        print(error.toString());
      }

  }


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
                      TextFieldUnderline(
                        controller: fullName,
                        hintText: "Full name",
                        hintTextColor: Colors.white,
                        normalBorderColor: XColors.primaryColor,
                        //borderColor: XColors.primaryColor,
                        //fillColor: Colors.white,
                        //hint: "Full Name",
                        //currentNode: _fullName,
                        //label: "Full Name",
                        //labelColor: XColors.primaryColor,
                        //preffixIcon: Icon(Icons.account_circle_outlined),
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
                  onClick: (){
                    regUser();
                  },
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
