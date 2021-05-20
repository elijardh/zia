import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class HomePageWidget extends StatelessWidget {
  final ProductModel model;
  HomePageWidget({this.model});
  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: config.sh(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: config.sw(150),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: model.image != null ? NetworkImage(model.image) : AssetImage("assets/images/shopitem.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NormalText(
                  text: "Price:  ",
                  textColor: Colors.black,
                ),
                NormalText(
                  text: model.price != null ? model.price.toString(): "N/A",
                  textColor: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
