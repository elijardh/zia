import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/Presentation/Views/onboardingview.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/customdotwidget.dart';
import 'package:zia/widgets/y_margin.dart';

import 'bridgescreen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currindex = 0;
  final SizeConfig config = new SizeConfig();
  void pageChange() {
    if (controller.index == 2) {
      navigate(context, HomePage());
    }
  }

  final SwiperController controller = new SwiperController();
  List<Widget> onBoardingElement = [
    OnBoardingView(
      text:
          "We provide you with end-to-end security, making sure all your transactions are encrypted with ourpatented SHA-256 algorithm and hosted on theblockchain.",
      splashTitle: "You're secure!",
      imageString: "assets/images/onboarding1.png",
    ),
    OnBoardingView(
      text:
          "Zia offers you a sure money-back gurantee if your ordered product does not reach your doorstep with 59 seconds. You think that’s crazy? Watch us!",
      splashTitle: "Delivery in seconds",
      imageString: "assets/images/onboarding2.png",
    ),
    OnBoardingView(
      splashTitle: "Diverse catalog",
      text:
          "We can gurantee a catalog of products that is so diverse it’ll put Hollywood and Silicon Valley companies to shame.",
      imageString: "assets/images/onboarding3.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: SizeConfig.screenHeightDp,
            width: SizeConfig.screenWidthDp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: config.sh(450),
                  child: Swiper(
                    controller: controller,
                    autoplay: true,
                    loop: true,
                    scrollDirection: Axis.horizontal,
                    onIndexChanged: (int) {
                      setState(() {
                        currindex = int;
                      });
/*                      if (int == 2) {
                        Timer(Duration(seconds: 2), () {
                          navigateReplace(context, BridgePage());
                        });
                      }*/
                    },
                    itemCount: onBoardingElement.length,
                    layout: SwiperLayout.DEFAULT,
/*                    pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: XColors.primaryColor,
                          activeColor: Colors.white,
                          space: 10,
                        )),*/
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        child: onBoardingElement[index],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List<Widget>.generate(onBoardingElement.length,
                      (int index) {
                    return CustomDotWidget(
                      index: index,
                      currentIndex: currindex,
                      height: 5,
                      activeheight: 8,
                      size: 50,
                      activeSize: 200,
                      active: XColors.primaryColor,
                      inactive: XColors.primaryColor.withOpacity(0.5),
                    );
                  }),
                ),
                YMargin(40),
                XButton(
                  onClick: () {
                    navigateReplace(context, BridgePage());
                  },
                  text: 'NEXT',
                  buttonColor: XColors.primaryColor,
                  textColor: Colors.white,
                  radius: 5,
                  width: config.sw(400),
                ),
                YMargin(20),
              ],
            )),
      ),
    );
  }
}
