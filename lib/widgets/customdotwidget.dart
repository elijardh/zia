import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';

Widget CustomDotWidget({int index, int currentIndex,int height,int activeheight,int size,int activeSize, Color inactive, Color active}){
  final SizeConfig config = SizeConfig();
  return Container(
    padding: EdgeInsets.all(5),
    child: Container(
      height: index == currentIndex? config.sh(activeheight) : config.sh(height),
      width: index == currentIndex? config.sw(activeSize) : config.sw(size),
      decoration: BoxDecoration(
          color: index == currentIndex? active : inactive,
          borderRadius: BorderRadius.circular(20)
      ),
    ),
  );
}