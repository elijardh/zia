import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/utils/colors.dart';

class UploadVM extends ChangeNotifier {
  Reference storageReference = FirebaseStorage.instance.ref();
  PickedFile image;
  bool uploading;

  uploadImage() async {
    PickedFile temp =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    image = temp;
    notifyListeners();
  }

  Future<String> uploadImageFire() async {
    String name = image.path.split("/").last;
    Reference ref = storageReference.child("/productimage");
    UploadTask task = ref.child(name).putFile(File(image.path));
    TaskSnapshot taskSnapshot = await task;
    String url = await taskSnapshot.ref.getDownloadURL();
    print(url);
    return url;
  }

  fullUpload(
      {BuildContext context,
      int price,
      String amount,
      String category,
      String description,
      String title}) {
    uploading = true;
    notifyListeners();
    uploadImageFire().then((value) {
      uploadData(
          image: value,
          title: title,
          description: description,
          category: category,
          amount: amount,
          price: price,
          context: context);
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }

  Future uploadData(
      {BuildContext context,
      int price,
      String amount,
      String category,
      String description,
      String image,
      String title}) async {
    FirebaseFirestore.instance.collection("products").doc().set({
      "image": image,
      "price": price,
      "amount": amount,
      "category": category,
      "description": description,
      "name": title
    }).then((value) {
      uploading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Upload Succesful",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: XColors.primaryColor,
      ));
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }
}
