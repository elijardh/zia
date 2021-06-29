import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({this.model});

  final SizeConfig config = new SizeConfig();
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: config.sh(140),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: config.sw(150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: model.image != null
                      ? NetworkImage(model.image)
                      : AssetImage("assets/images/shopitem.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: RichText(
                text: TextSpan(
                    text: "Price: ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                    text: model.price != null
                        ? '£ ${model.price.toString()}'
                        : "N/A",
                    style: TextStyle(
                      color: XColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
