import 'package:flutter/material.dart';
import 'package:zia/Presentation/Pages/cart_page/cartpage.dart';
import 'package:zia/Presentation/Pages/order_page/orderpage.dart';
import 'package:zia/Presentation/Pages/upload_page/uploadpage.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/y_margin.dart';

class DrawerWidget extends StatelessWidget {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/Doodle.png"),
            fit: BoxFit.contain,
          )),
      width: SizeConfig.screenWidthDp,
      height: SizeConfig.screenHeightDp,
      child: Column(
        children: [
          Image.asset("assets/images/ziaIcon.png"),
          YMargin(40),
          GestureDetector(
            onTap: () {
              navigate(context, UploadPage());
            },
            child: ListTile(
              title: Text("Upload a Product"),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigate(context, CartPage());
            },
            child: ListTile(
              title: Text("Check your Cart"),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigate(context, OrderPage());
            },
            child: ListTile(
              title: Text("Your Orders"),
            ),
          ),
        ],
      ),
    );
  }
}
