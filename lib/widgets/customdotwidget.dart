import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';

Widget CustomDotWidget(int index, int currentIndex){
  final SizeConfig config = SizeConfig();
  return Container(
    padding: EdgeInsets.all(5),
    child: Container(
      height: config.sh(10),
      width: index == currentIndex? config.sw(25) : config.sw(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80)
      ),
    ),
  );
}