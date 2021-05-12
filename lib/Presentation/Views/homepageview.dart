import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';

class HomePageWidget extends StatelessWidget {
  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Container(
        width: config.sw(150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/images/shopitem.png",),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
