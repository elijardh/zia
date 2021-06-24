import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zia/utils/colors.dart';

class SendOrderVM extends ChangeNotifier{
  PickedFile image;
  Reference storageReference = FirebaseStorage.instance.ref();
  bool loading = false;

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

  Future sendOrder(DocumentReference ref, String img, BuildContext context) async{
     FirebaseFirestore.instance.collection("sentorder").doc().set({
       "image" : img,
       "orderRef" : ref,
     }).onError((error, stackTrace) {
       loading = false;
       notifyListeners();
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("${error.toString()}"),
         backgroundColor: XColors.primaryColor,
       ));
     }).then((value) {
       loading = false;
       notifyListeners();
     });
  }

  Future finalUpload(DocumentReference ref, BuildContext context){
    loading = true;
    notifyListeners();
    uploadImageFire().then((value) { 
      sendOrder(ref,value,context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: XColors.primaryColor,
        content: Text("Order sent succesfully, send the physical prdocut via logistics",style: TextStyle(color:Colors.white),),
      ));
      }).onError((error, stackTrace) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error.toString()}"),));});   
  }

}