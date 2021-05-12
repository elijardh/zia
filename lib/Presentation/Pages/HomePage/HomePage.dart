import 'package:flutter/material.dart';
import 'package:zia/Presentation/Views/homepageview.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage({this.name});
  @override
  _HomePageState createState() => _HomePageState(name: name);
}

class _HomePageState extends State<HomePage> {
  final String name;

  _HomePageState({this.name});

  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: SizeConfig.screenHeightDp,
            width: SizeConfig.screenWidthDp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/ziaIcon.png", scale: 2.5,),
                        NormalText(
                          text: "When we said diverse catalogs, we meant it",
                          textColor: Colors.black,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    Container(
                      height: config.sh(50),
                      width: config.sw(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: NormalText(
                        text: "Dare",
                      ), /*Icon(Icons.person, color: Colors.black,)*/
                    ),
                  ],
                ),
                YMargin(25),
                Container(
                  height: config.sh(35),
                  width: SizeConfig.screenWidthDp,
                  child: ListView(
                    scrollDirection: Axis.horizontal,

                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 5,
                          width: config.sw(100),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: XColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: NormalText(
                              text:"Electronics",
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: config.sh(10),
                          width: config.sw(100),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: XColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: NormalText(
                              text:"Fashion",
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: config.sh(30),
                          width: config.sw(100),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: XColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: NormalText(
                              text:"Sports",
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: config.sh(30),
                          width: config.sw(100),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: XColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: NormalText(
                              text:"Education",
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: config.sh(30),
                          width: config.sw(100),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: XColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: NormalText(
                              text:"Children",
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(20),
                TitleText(
                  text: "Trending!",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                NormalText(
                  text: "Here are trending items under this Category",
                  textColor: Colors.black.withOpacity(0.5),
                ),
                YMargin(20),
                Container(
                  height: config.sh(200),
                  child: ListView.builder(itemBuilder: (BuildContext context, index){
                    return HomePageWidget();
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  ),
                ),
                YMargin(10),
                Row(
                  children: [
                    NormalText(
                      text:"Yeah, you wanna see more cool stuff?",
                      textColor: Colors.black.withOpacity(0.5),
                    ),
                    NormalText(
                      text: "Get Premium",
                      textColor: XColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                YMargin(10),
              ],
            ),
          )
        ),
      )
    );
  }
}
