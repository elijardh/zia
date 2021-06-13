import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

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
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
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
                        ))),
        ));
  }
}
