import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zia/utils/colors.dart';


class Indicator extends StatelessWidget {
  Indicator({
    @required this.controller,
    this.itemCount = 0,
    this.currSizeHeight,
    this.currSizeWidth,
    this.normalColor,
    this.selectedColor,
  }) : assert(controller != null);

  final SwiperController controller;
  final int itemCount;
  final Color normalColor;
  final Color selectedColor;
  final double size = 6.0;
  final double currSizeWidth;
  final double currSizeHeight;
  final double spacing = 2.0;

  Widget _buildIndicator(int index, int pageCount, double dotSize, double spacing) {
    final bool isCurrentPageSelected = index == (controller.index != null ? controller.index.round() % pageCount: 0);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: spacing),
      child: Container(
        width: isCurrentPageSelected ? 25 : dotSize,
        height: isCurrentPageSelected ? 10 :  dotSize,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
/*            width: isCurrentPageSelected ? 25 : dotSize,
              height: isCurrentPageSelected ? 45 :  dotSize,*/
              decoration: BoxDecoration(
                shape: isCurrentPageSelected ? BoxShape.rectangle : BoxShape.circle,
                color: isCurrentPageSelected ? selectedColor : normalColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}