import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';

class SpecificOrderPage extends StatefulWidget {
  @override
  _SpecificOrderPageState createState() => _SpecificOrderPageState();
}

class _SpecificOrderPageState extends State<SpecificOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
              leading: IconButton(
          icon: Icon(
            Icons.close_fullscreen_outlined,
            color: XColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}