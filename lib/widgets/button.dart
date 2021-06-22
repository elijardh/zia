import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class XButton extends StatelessWidget {

  final double height;
  final double width;
  final Function onClick;
  final String text;
  final double radius;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;
  final Color progressColor;
  final double textSize;
  final FontWeight fontWeight;

  XButton({
    @required this.onClick,
    @required this.text,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.isLoading,
    this.progressColor,
    this.textSize,
    this.fontWeight
  });

  final SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        height: height != null ? config.sh(height) : config.sh(50),
        width: width != null ? config.sw(width) : config.sw(100),
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).accentColor,
          borderRadius: radius != null ? BorderRadius.circular(radius) : BorderRadius.circular(5.0)
        ),
        child: Center(
          child:
          isLoading == null ?
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? config.sp(17): config.sp(textSize),
            fontWeight: fontWeight ?? FontWeight.normal,
          ): !isLoading ?
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? config.sp(17): config.sp(textSize),
            fontWeight: fontWeight ?? FontWeight.normal,
          ): isLoading ?
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): null,),
            height: config.sh(20),
            width: config.sh(20),
          ) :
          NormalText(
            text: text,
            textColor: textColor ?? Colors.white,
            fontSize: textSize == null ? config.sp(17): config.sp(textSize),
            fontWeight: fontWeight ?? FontWeight.normal,
          )
        ),
      ),
    );
  }
}
