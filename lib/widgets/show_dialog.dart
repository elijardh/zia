import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';

void showActionDialog(BuildContext context, {
                        String message,
                        String negative = 'Back',
                        String positive,
                        Widget dialogContext,
                        List<Widget> actions,
                        Function onPressed}) {
  showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          content: dialogContext ?? Text(
            message == null ? "Dialog action" : message,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          actions: actions ?? <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                negative,
                style: TextStyle(color: XColors.primaryColor),
              ),
            ),
            FlatButton(
              onPressed: onPressed ?? () {},
              child: Text(
                positive == null ? "OK" : positive,
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      });
}
