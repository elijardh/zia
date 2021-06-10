import 'package:flutter/material.dart';
import 'package:zia/Domain/cartModel.dart';
import 'package:zia/data/local/database/database.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/texts.dart';

class CartVM extends ChangeNotifier {
  DatabaseProvider databaseProvider;
  List<CartModel> listModels = [];

  addToList(BuildContext context) async {
    databaseProvider.getCart().then((value) {
      listModels = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: NormalText(
          text: error.toString(),
          fontWeight: FontWeight.bold,
          textColor: XColors.primaryColor,
        ),
        backgroundColor: Colors.white,
      ));
    });
  }
}
