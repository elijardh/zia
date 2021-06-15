import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zia/Domain/ProductModel.dart';

Future<List<ProductModel>> getProduct() async {
  await FirebaseFirestore.instance.collection("products").get().then((value) {
    value.docs.forEach((element) {
      print(element.toString());
    });
    List<ProductModel> list;
    value.docs.forEach((element) {
      Map<dynamic, dynamic> map = element.data();
      map.forEach((key, value) {
        list.add(value);
      });
    });
    print(list[0].price);
    return list;
  }).catchError((e) {
    print(e.toString());
  });

  return null;
}
