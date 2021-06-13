import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadVM extends ChangeNotifier {
  PickedFile image;

  uploadImage() async {
    PickedFile temp =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    image = temp;
    notifyListeners();
  }

  uploadWholeData() {}
}
