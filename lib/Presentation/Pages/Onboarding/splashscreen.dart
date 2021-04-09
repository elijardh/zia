import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';

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
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255,217,25,1),
        height: SizeConfig.screenHeightDp,
        width:  SizeConfig.screenWidthDp,
        child: Center(child: Image.asset("assets/images/zia.png")),
      ),
    );
  }
}

