import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Presentation/ViewModel/send_order_vm/sendodervm.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class SendOrderPage extends StatefulWidget {
  final DocumentReference ref;
  SendOrderPage({this.ref});
  @override
  _SendOrderPageState createState() => _SendOrderPageState();
}

class _SendOrderPageState extends State<SendOrderPage> {

  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: XButton(
        onClick: (){
          context.read<SendOrderVM>().finalUpload(widget.ref, context);
        },
        text: "Send Order",
        buttonColor: XColors.primaryColor,
        radius: 5,
        textColor: Colors.white,
        width: SizeConfig.screenWidthDp,
      ),
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
        elevation: 0,

      ),
      body: Container(
        child: Column(
          children: [
            YMargin(40),
            NormalText(
              text: "Please upload the image of all the items combined",
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),

            Consumer<SendOrderVM>(
              builder: (context, notifier, child) => InkWell(
                onTap: notifier.uploadImage(),
                              child: Container(
                  height: config.sh(400),
                  width: SizeConfig.screenWidthDp,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: notifier.image != null ? FileImage(File(notifier.image.path)) : null,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: XColors.primaryColor.withOpacity(0.3),
                  
                  ),
                  child: notifier.image == null ? Icon(Icons.camera_alt, color: Colors.black,) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}