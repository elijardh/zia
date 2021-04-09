import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/Presentation/Pages/RegisterPage/Register.dart';
import 'package:zia/Presentation/Views/onboardingview.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  void pageChange(){
    if(controller.index == 2){
      navigate(context,HomePage());
    }
  }
  final SwiperController controller = new SwiperController();
  List<Widget> onBoardingElement = [
    OnBoardingView(
      text: "We Have all forms of clothing...",
      imageString: "assets/images/clothing.png",
    ),
    OnBoardingView(
      text: "... all your Appliances...",
      imageString: "assets/images/appliances.jpg",
    ),
    OnBoardingView(
      text: ".. and all your phone accessory",
      imageString: "assets/images/mobile.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: SizeConfig.screenHeightDp,
          width: SizeConfig.screenWidthDp,
          child: Swiper(
            controller: controller,
            autoplay: true,
            onIndexChanged: (int) {
              if(int == 2){
                Timer(Duration(seconds: 2), () {
                  navigateReplace(context, Register());
                });
              }
            },
            itemCount: onBoardingElement.length,
            layout: SwiperLayout.DEFAULT,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: XColors.primaryColor,
                activeColor: Colors.white,
                space: 10,
              )
            ),
            itemBuilder: (BuildContext context, index){
              return Container(
                  //color:Colors.white,
                  child:onBoardingElement[index]);
            },
          )
        ),
      ),
    );
  }
}
