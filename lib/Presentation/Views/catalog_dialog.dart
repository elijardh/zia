import 'package:flutter/material.dart';
import 'package:zia/Presentation/Pages/cart_page/cartpage.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class CatalogDialog extends StatelessWidget {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: config.sh(400),
        width: config.sw(400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            YMargin(20),
            Image.asset("assets/images/catdia.png"),
            YMargin(20),
            NormalText(
              text: "Added to Cart",
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SubtitleText(
              text:
                  "Now you have one more vanity item to purchase due to peer pressure and being overly self-consious",
              maxLines: 3,
              fontSize: 10,
              textColor: Colors.black.withOpacity(0.7),
            ),
            YMargin(20),
            XButton(
              width: config.sw(300),
              text: "Check your cart",
              textColor: Colors.white,
              radius: 20,
              buttonColor: XColors.primaryColor,
              onClick: () {
                Navigator.pop(context);
                navigate(context, CartPage());
              },
            ),
            YMargin(20),
            XButton(
              text: "Go Back",
              textColor: XColors.primaryColor,
              buttonColor: Colors.white,
              onClick: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
