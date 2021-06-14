import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zia/Presentation/ViewModel/upload_vm/uploadvm.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  TextEditingController productName = TextEditingController();
  TextEditingController productCost = TextEditingController();
  TextEditingController productAmount = TextEditingController();
  TextEditingController productDescription = TextEditingController();

  String category;
  PickedFile _fileImage;
  SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: XButton(
          onClick: () => navigate(context, CartPage()),
          text: "Upload Product",
          textColor: Colors.white,
          height: config.sh(50),
          width: SizeConfig.screenWidthDp,
          buttonColor: XColors.primaryColor,
          radius: 0,
        ),
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
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: "Product Name",
                      textColor: Colors.black,
                    ),
                    EUnderLineButton(
                      controller: productName,
                      hintText: "Product Name",
                      hintTextColor: Colors.black,
                      fillColor: XColors.primaryColor.withOpacity(0.2),
                      enabledBorderColor: XColors.primaryColor,
                      focusedBorderColor: XColors.primaryColor,
                    ),
                    YMargin(50),
                    NormalText(
                      text: "Price",
                      textColor: Colors.black,
                    ),
                    EUnderLineButton(
                      controller: productCost,
                      hintText: "Price",
                      hintTextColor: Colors.black,
                      fillColor: XColors.primaryColor.withOpacity(0.2),
                      enabledBorderColor: XColors.primaryColor,
                      focusedBorderColor: XColors.primaryColor,
                    ),
                    YMargin(50),
                    NormalText(
                      text: "Amount in Stock",
                      textColor: Colors.black,
                    ),
                    EUnderLineButton(
                      controller: productAmount,
                      hintText: "How much of the product do you have",
                      hintTextColor: Colors.black,
                      fillColor: XColors.primaryColor.withOpacity(0.2),
                      enabledBorderColor: XColors.primaryColor,
                      focusedBorderColor: XColors.primaryColor,
                    ),
                    NormalText(
                      text: "Category",
                      textColor: Colors.black,
                    ),
                    DropdownButton<String>(
                      elevation: 0,
                      value: "Select Category",
                      icon: const Icon(Icons.arrow_downward),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        setState(() {
                          category = value;
                        });
                      },
                      items: <String>[
                        'Electronics',
                        'Jewelery',
                        "Men's Clothing",
                        "Women's Clothing"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    YMargin(50),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: XColors.primaryColor.withOpacity(0.2),
                          labelText: "Describe the product",
                        ),
                        controller: productDescription,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
