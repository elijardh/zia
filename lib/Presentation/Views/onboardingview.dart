import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class OnBoardingView extends StatelessWidget {
  final String text;
  final String splashTitle;
  final String imageString;
  OnBoardingView({this.text,this.imageString, this.splashTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ziaIcon.png", fit: BoxFit.contain, scale: 1.5,),
            ],
          ),
          YMargin(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageString, fit: BoxFit.contain,),
            ],
          ),
          YMargin(10),
          TitleText(
            text: splashTitle,
            textColor: Colors.black,
            textAlign: TextAlign.left,
            fontSize: 30,
          ),
          YMargin(10),
          Container(
            width: 400,
            child: Text(text,style:  TextStyle(
              color: Colors.black.withOpacity(0.8),
            ),
            overflow: TextOverflow.visible,),
          ),
        ],
      ),
    );
  }
}
