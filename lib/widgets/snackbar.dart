import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';

void showSnackBar(
  GlobalKey<ScaffoldState> _scaffoldKey, {
  String message = 'An error occured',
  String label = 'DISMISS',
  Function onPressed,
  int duration
}) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: XColors.primaryColor,
    content: Text(
      message == null
          ? 'An error occured'
          : message.isNotEmpty ? message : 'An error occured',
      style: const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      ),
    ),
    duration: Duration(seconds: duration ?? 5 ),
    action: SnackBarAction(
      label: label,
      textColor: Colors.white,
      onPressed: onPressed ?? () {},
    ),
  ));
}
