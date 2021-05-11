import 'package:flutter/material.dart';
import 'package:zia/Presentation/Pages/RegisterPage/Register.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class BridgePage extends StatefulWidget {
  @override
  _BridgePageState createState() => _BridgePageState();
}

class _BridgePageState extends State<BridgePage> {

  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeightDp,
            width: SizeConfig.screenWidthDp,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ziaIcon.png", fit: BoxFit.contain, scale: 1.5,),
                  ],
                ),
                YMargin(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/loginRegister.png", fit: BoxFit.contain,),
                  ],
                ),
                YMargin(10),
                TitleText(
                  text: "Let's get you started!",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                Container(
                  width: 500,
                  child: NormalText(
                    text: "We’re glad to introduce to the new age of e-commerce. Zia will reinvent the way buying and selling works online but we need you to be a part of it. If you already possess a ticket to the revamped e-commerce future you may click “Login”, but if you’re new here, you can also sign up below!",
                    textColor: Colors.black.withOpacity(0.6),
                    maxLines: 10,

                  ),
                ),
                YMargin(30),
                XButton(
                  text: "LOG IN",
                  textColor: Colors.white,
                  width: SizeConfig.screenWidthDp,
                  radius: 5,
                  buttonColor: XColors.primaryColor,
                ),
                YMargin(10),
                XButton(
                  onClick: (){
                    navigate(context, Register());
                  },
                  text: "Sign Up",
                  textColor: XColors.primaryColor,
                  width: SizeConfig.screenWidthDp,
                  radius: 5,
                  buttonColor: Colors.white,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
