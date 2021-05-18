import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class HomePageWidget extends StatelessWidget {
  final String image;
  final String cost;
  HomePageWidget({this.cost, this.image});
  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: config.sw(150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: image.isEmpty? NetworkImage(image) : AssetImage("assets/images/shopitem.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: NormalText(
            text: cost.isEmpty? cost: "N/A",
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
