import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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

  uploadWholeData(BuildContext context) async {
    String url;
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
      url = value;
    });
  }
}
