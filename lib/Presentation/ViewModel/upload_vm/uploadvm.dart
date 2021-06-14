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

  uploadImage() async {
    PickedFile temp =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    image = temp;
    notifyListeners();
  }

  uploadWholeData(BuildContext context, ProductModel model) async {
    Reference ref = storageReference.child("productimage");
    UploadTask task =
        ref.child("${image.toString()}").putFile(File(image.path));
    TaskSnapshot shot = await task.catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: XColors.primaryColor,
      ));
    });
    shot.ref.getDownloadURL().then((value) {
      model.image = value;
      FirebaseFirestore.instance.collection("products").doc().set({
        "image": model.image,
        "price": model.price,
        "amount": model.id,
        "category": model.category,
        "description": model.description,
        "name": model.title
      }).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Upload Succesful")));
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    });
  }
}
