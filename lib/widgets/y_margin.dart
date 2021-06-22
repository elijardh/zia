import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';

class YMargin extends StatelessWidget {

  final double height;

  YMargin(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig().sh(height),
    );
  }
}
