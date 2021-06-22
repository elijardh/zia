import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';

class TitleText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight fontWeight;

  TitleText({@required this.text, this.fontSize, this.textColor, this.textAlign, this.maxLines, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign != null ? textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline1
          .copyWith(
            fontSize: fontSize != null ? SizeConfig().sp(fontSize): SizeConfig().sp(25),
            color: textColor != null ? textColor: Colors.black,
            fontWeight: fontWeight ?? FontWeight.bold
          ),
    );
  }
}

class NormalText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final int maxLines;
  NormalText({@required this.text, this.fontSize, this.textColor, this.textAlign, this.fontWeight, this.maxLines});
  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign != null ? textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1
          .copyWith(
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): SizeConfig().sp(15),
          color: textColor != null ? textColor: Colors.black,
          fontWeight: fontWeight
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final int maxLines;

  SubtitleText({@required this.text, this.fontSize, this.textColor, this.textAlign, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign != null ? textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline2
          .copyWith(
        fontWeight: FontWeight.w800,
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): SizeConfig().sp(20),
          color: textColor != null ? textColor: Colors.black
      ),
    );
  }
}

class AccentText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final int maxLines;

  AccentText({@required this.text, this.fontSize, this.textColor, this.textAlign, this.maxLines});

  @override
  Widget build(BuildContext context) {

    return Text(text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign != null ? textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1
          .copyWith(
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): SizeConfig().sp(15),
          color: textColor != null ? textColor: Colors.black
      ),
    );
  }
}

