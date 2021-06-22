import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';
import 'onboarding.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), () {

      navigateReplace(context, OnBoarding());
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              YMargin(200),
              Image.asset("assets/images/ziaIcon.png"),
              NormalText(
                text: "The one place for everything you want!",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              NormalText(
                text: "(Anyone who says otherwise is trying to scam you)",
                textColor: Colors.black.withOpacity(0.5),
              ),

              YMargin(165),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/splash.png")
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

