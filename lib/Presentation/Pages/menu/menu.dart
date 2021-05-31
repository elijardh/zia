import 'package:flutter/material.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class Menu extends StatefulWidget {
  final UserModel model;
  Menu({this.model});
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
                image: NetworkImage("https://static.wikia.nocookie.net/kubera/images/3/3a/3-188_Yaksha.png/revision/latest/scale-to-width-down/310?cb=20210413055331"),
                placeholder: AssetImage("assets/images/userPH.png"),
              ),
            ),
            NormalText(text: widget.model.fullName,textColor: Colors.black,fontWeight: FontWeight.bold,),

            NormalText(
              text: widget.model.email,
              textColor: Colors.black.withOpacity(0.5),
            ),
            YMargin(20),
            GestureDetector(
              onTap: (){

              },
              child: NormalText(
                text: "Edit Profile",
                textColor: XColors.primaryColor,
              ),
            ),
            YMargin(50),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: config.sh(50),
                    width: config.sw(50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: XColors.primaryColor,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/TwoFact.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "2-Factor Authentication",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: "Make your account water-tight by enabling our patented SHA-256 encryption 2FA Authentication ",
                      textColor: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: config.sh(50),
                    width: config.sw(50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/interface.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "Interface Settings",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: "Change the theme, brightness, constrast, color scheme. Make this app  *YOUR* app!",
                      textColor: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: config.sh(50),
                    width: config.sw(50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/refer.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "Refer A Friend",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: "We don’t really need to attach some sort of reward right? Your friends need to get a taste of this",
                      textColor: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: config.sh(50),
                    width: config.sw(50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/heart.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "Your Liked Items",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: "Items you couldn’t buy, so you liked. SMH",
                      textColor: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      maxLines: 3,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: config.sh(50),
                    width: config.sw(50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor,
                        shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/images/gear.png")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "Other Settings",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    NormalText(
                      text: "Other stuff you can do like accessibility settings, notification settings and stuff.",
                      textColor: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      maxLines: 3,
                    ),
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
