import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
        Padding(padding: EdgeInsets.only(left: 30),
        child: NormalText(
          text: "Menu",
          textColor: XColors.primaryColor,
        ),)
      ],
      ),
      body: Container(
        child: Column(
          children: [
            YMargin(50),
            Container(
              width: config.sw(100),
              height: config.sh(100),
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: FadeInImage(
                image: NetworkImage(""),
                placeholder: AssetImage("assets/images/userPH.png"),
              ),
            ),
            NormalText(text: "",textColor: Colors.black,fontWeight: FontWeight.bold,),

            NormalText(
              text: "",
              textColor: Colors.black.withOpacity(0.5),
            ),
            YMargin(20),
            NormalText(
              text: "Edit Profile",
              textColor: XColors.primaryColor,
            ),
            YMargin(50),

            Row(
              children: [
                Image.asset(""),
                Column(
                  children: [
                    NormalText(
                      text: "",
                      textColor: Colors.black,
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(""),
                Column(
                  children: [

                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(""),
                Column(
                  children: [

                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(""),
                Column(
                  children: [

                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(""),
                Column(
                  children: [

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
