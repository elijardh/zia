import 'package:flutter/material.dart';
import 'package:zia/Domain/cartModel.dart';
import 'package:zia/data/local/database/database.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/texts.dart';

class CartVM extends ChangeNotifier {
  List<CartModel> listModels = [];
  int totalCost = 0;

  addToList(BuildContext context) async {
    DatabaseProvider.instance.getCart().then((value) {
      listModels = value;
      print(listModels[0].name);
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

  void getTotalCost() {
    totalCost = 0;
    for (int i = 0; i < listModels.length; i++) {
      totalCost = totalCost + (listModels[i].price * listModels[i].amount);
    }
  }

  increaseAmount(int index) {
    listModels[index].amount++;
    getTotalCost();
    notifyListeners();
  }

  decreasesAmount(int index) {
    listModels[index].amount--;
    getTotalCost();
    notifyListeners();
  }
}
