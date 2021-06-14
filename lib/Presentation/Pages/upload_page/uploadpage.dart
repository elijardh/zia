import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zia/Presentation/ViewModel/upload_vm/uploadvm.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PickedFile _fileImage;
  SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.close_fullscreen_outlined,
              color: XColors.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "New Product",
                style: TextStyle(
                  color: XColors.primaryColor,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          height: SizeConfig.screenHeightDp,
          width: SizeConfig.screenWidthDp,
          child: Column(
            children: [
              YMargin(50),
              GestureDetector(
                onTap: context.read<UploadVM>().uploadImage(),
                child: Container(
                  height: config.sh(100),
                  width: config.sw(100),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: XColors.primaryColor),
                  child: context.watch<UploadVM>().image != null
                      ? Image.file(File(context.watch<UploadVM>().image.path))
                      : Icon(
                          Icons.camera,
                          color: Colors.white,
                        ),
                ),
              ),
              YMargin(20),
              NormalText(
                text: "Product Image",
                fontWeight: FontWeight.bold,
                textColor: Colors.black,
              ),
            ],
          ),
        ) /*GestureDetector(
              onTap: () async {
                PickedFile test = await ImagePicker.platform
                    .pickImage(source: ImageSource.gallery);
                setState(() {
                  _fileImage = test;
                });
              },
              child: Container(
                  child: _fileImage != null
                      ? Image.file(
                          File(_fileImage.path),
                          fit: BoxFit.fill,
                        )
                      : Center(
                          child: Text("No Image"),
                        ))),*/
            ));
  }
}
