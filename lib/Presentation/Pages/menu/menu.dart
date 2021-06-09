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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close_fullscreen_outlined,
            color: XColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              YMargin(20),
              Container(
                width: config.sw(100),
                height: config.sh(100),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://static.wikia.nocookie.net/kubera/images/3/3a/3-188_Yaksha.png/revision/latest/scale-to-width-down/310?cb=20210413055331",
                        ),
                        onError: (e, c) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: NormalText(
                              text: e.toString(),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: XColors.primaryColor,
                            ),
                            backgroundColor: Colors.white,
                          ));
                        })),
/*                child: FadeInImage(
                  image: NetworkImage(
                      "https://static.wikia.nocookie.net/kubera/images/3/3a/3-188_Yaksha.png/revision/latest/scale-to-width-down/310?cb=20210413055331"),
                  placeholder: AssetImage("assets/images/userPH.png"),
                ),*/
              ),
              NormalText(
                text: widget.model.fullName ?? "Test",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              NormalText(
                text: widget.model.email,
                textColor: Colors.black.withOpacity(0.5),
              ),
              YMargin(20),
              GestureDetector(
                onTap: () {},
                child: TitleText(
                  text: "Edit Profile",
                  textColor: XColors.primaryColor,
                ),
              ),
              YMargin(10),
              ListTile(
                title: NormalText(
                  text: "2-Factor Authentication",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: NormalText(
                  text:
                      "Make your account water-tight by enabling our patented SHA-256 encryption 2FA Authentication ",
                  textColor: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  maxLines: 3,
                ),
                leading: Container(
                    width: config.sw(30),
                    height: config.sh(30),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/TwoFact.png",
                      color: Colors.white,
                    )),
              ),
              ListTile(
                title: NormalText(
                  text: "Interface Settings",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: NormalText(
                  text:
                      "Change the theme, brightness, constrast, color scheme. Make this app  *YOUR* app!",
                  textColor: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  maxLines: 3,
                ),
                leading: Container(
                    width: config.sw(30),
                    height: config.sh(30),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/interface.png",
                      color: Colors.white,
                    )),
              ),
              ListTile(
                title: NormalText(
                  text: "Refer A Friend",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: NormalText(
                  text:
                      "We don’t really need to attach some sort of reward right? Your friends need to get a taste of this",
                  textColor: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  maxLines: 3,
                ),
                leading: Container(
                    width: config.sw(30),
                    height: config.sh(30),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/refer.png",
                      color: Colors.white,
                    )),
              ),
              ListTile(
                title: NormalText(
                  text: "Your Liked Items",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: NormalText(
                  text: "Items you couldn’t buy, so you liked. SMH",
                  textColor: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  maxLines: 3,
                ),
                leading: Container(
                    width: config.sw(30),
                    height: config.sh(30),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/heart.png",
                      color: Colors.white,
                    )),
              ),
              ListTile(
                title: NormalText(
                  text: "Other Settings",
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: NormalText(
                  text:
                      "Other stuff you can do like accessibility settings, notification settings and stuff.",
                  textColor: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  maxLines: 3,
                ),
                leading: Container(
                    width: config.sw(30),
                    height: config.sh(30),
                    decoration: BoxDecoration(
                        color: XColors.primaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/gear.png",
                      color: Colors.white,
                    )),
              ),
              YMargin(50)
            ],
          ),
        ),
      ),
    );
  }
}
