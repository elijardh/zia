import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class OnBoardingView extends StatelessWidget {
  final String text;
  final String imageString;
  OnBoardingView({this.text,this.imageString});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeightDp,
      width: SizeConfig.screenWidthDp,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),

        image: DecorationImage(
          image: AssetImage(imageString),
          fit: BoxFit.fill,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.8),
              BlendMode.darken),
        )
      ),
      child: Center(
        child: Text(text,style: TextStyle(color: XColors.primaryColor, fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
      ),
    );
  }
}
