import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/Presentation/ViewModel/upload_vm/uploadvm.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:zia/widgets/button.dart';
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
          progressColor: Colors.white,
          onClick: () {
            print("hello");
            print(productName.value.text);
            context.read<UploadVM>().fullUpload(
                context: context,
                price: int.parse(productCost.value.text),
                amount: productAmount.value.text,
                category: category,
                description: productDescription.value.text,
                title: productName.value.text);
          },
          text: "Upload Product",
          isLoading: context.watch<UploadVM>().uploading,
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          //height: SizeConfig.screenHeightDp,
          width: SizeConfig.screenWidthDp,
          child: Column(
            children: [
              YMargin(15),
              GestureDetector(
                onTap: () {
                  context.read<UploadVM>().uploadImage();
                },
                child: Container(
                  height: config.sh(150),
                  width: config.sw(150),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: XColors.primaryColor,
                    image: DecorationImage(
                        image: context.watch<UploadVM>().image != null
                            ? FileImage(
                                File(context.watch<UploadVM>().image.path),
                                scale: 0.5,
                              )
                            : AssetImage("assets/images/camera.png"),
                        fit: BoxFit.cover),
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
                    YMargin(20),
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
                    YMargin(20),
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
                    YMargin(20),
                    NormalText(
                      text: "Category",
                      textColor: Colors.black,
                    ),
                    YMargin(10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: XColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: config.sh(50),
                      width: config.sw(400),
                      child: DropdownButton<String>(
                        elevation: 0,
                        hint: Text("Select Category"),
                        value: category,
                        underline: Divider(
                          height: 2,
                          color: Colors.red,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          setState(() {
                            category = value;
                          });
                        },
                        items: <String>[
                          "Electronics",
                          "Jewelery",
                          "Men's Clothing",
                          "Women's Clothing"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    YMargin(50),
                    Container(
                      height: config.sh(200),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: XColors.primaryColor.withOpacity(0.3),
                      child: TextField(
                        //expands: true,
                        maxLines: 1000,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: XColors.primaryColor.withOpacity(0.2),
                          hintText: "Describe the product",
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
