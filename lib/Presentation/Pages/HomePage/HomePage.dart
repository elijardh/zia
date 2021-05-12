import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: SingleChildScrollView(
          child:Container(
            height: SizeConfig.screenHeightDp,
            width: SizeConfig.screenWidthDp,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/ziaIcon.png"),
                        NormalText(
                          text: "When we said diverse catalogs, we meant it",
                          textColor: Colors.black,
                        ),
                      ],
                    ),
                    Container(
                      height: config.sh(50),
                      width: config.sw(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, color: Colors.black,),
                    ),
                  ],
                ),
                YMargin(40),
                Container(
                  height: config.sh(100),
                  width: SizeConfig.screenWidthDp,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: config.sh(30),
                        width: config.sw(100),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: XColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: NormalText(
                          text:"Electronics",
                          textColor: Colors.white,
                        ),
                      ),
                      Container(
                        height: config.sh(30),
                        width: config.sw(100),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: XColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: NormalText(
                          text:"Fashion",
                          textColor: Colors.white,
                        ),
                      ),
                      Container(
                        height: config.sh(30),
                        width: config.sw(100),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: XColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: NormalText(
                          text:"Sports",
                          textColor: Colors.white,
                        ),
                      ),
                      Container(
                        height: config.sh(30),
                        width: config.sw(100),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: XColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: NormalText(
                          text:"Education",
                          textColor: Colors.white,
                        ),
                      ),
                      Container(
                        height: config.sh(30),
                        width: config.sw(100),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: XColors.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: NormalText(
                          text:"Children",
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
