import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/cartModel.dart';
import 'package:zia/Domain/models/card.dart';
import 'package:zia/Domain/models/charge_class.dart';
import 'package:zia/Domain/models/metadata.dart';
import 'package:zia/Domain/order_items.dart';
import 'package:zia/Domain/order_model.dart';
import 'package:zia/Domain/response/chargeresponse.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/HomePage/HomePage.dart';
import 'package:zia/Presentation/Pages/order_page/orderpage.dart';
import 'package:zia/data/local/database/database.dart';
import 'package:zia/data/network/FireBase/User/fire_user.dart';
import 'package:zia/data/network/pay_stack/paystack_charge.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class CartVM extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<CartModel> listModels = [];
  int totalCost = 0;
  bool loading = false;

  addToList(BuildContext context) async {
    DatabaseProvider.instance.getCart().then((value) {
      if (value.isNotEmpty) {
        listModels = value;
        print(listModels[0].name);
      }
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

  Future deleteFromList(int id, int index) async {
    DatabaseProvider.instance.deleteCart(id).then((value) {
      listModels.removeAt(index);
      notifyListeners();
    }).catchError((e) {
      print(e.toString());
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

  placeOrder(BuildContext context) async {
    var user = auth.currentUser;
    List<OrderItem> items = [];

    for (int i = 0; i < listModels.length; i++) {
      OrderItem item = OrderItem(
          itemName: listModels[i].name,
          itemPrice: listModels[i].price,
          itemQuantity: listModels[i].amount,
          itemRef: FirebaseFirestore.instance
              .doc("products/${listModels[i].objID}"));
      items.add(item);
    }
    OrderModel model = OrderModel(
        buyerID: FirebaseFirestore.instance.collection("users").doc(user.uid),
        totalCost: totalCost,
        items: items,
        status: "PENDING");
    print(model.items[0].itemRef);
    FirebaseFirestore.instance.collection("orders").doc().set({
      "buyerID": model.buyerID,
      "totalCost": model.totalCost,
      "items": model.toJson(model.items),
      "status": model.status
    }).then((value) {
      loading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "OrderPlaced",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: XColors.primaryColor,
      ));

      SizeConfig config = SizeConfig();
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                  content: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Doodle.png"),
                        fit: BoxFit.fill)),
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: config.sh(200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: "Your Order Has Been Sent",
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    YMargin(20),
                    XButton(
                      onClick: () {
                        navigateReplace(context, OrderPage());
                      },
                      text: "Go to Orders",
                      buttonColor: Colors.red,
                      radius: 10,
                      textColor: Colors.white,
                      width: SizeConfig.screenWidthDp,
                    ),
                    YMargin(20),
                    XButton(
                      onClick: () {
                        navigateReplace(context, HomePage());
                      },
                      text: "Go Home",
                      buttonColor: Colors.green,
                      radius: 10,
                      textColor: Colors.white,
                      width: SizeConfig.screenWidthDp,
                    ),
                  ],
                ),
              )));
    }).onError((error, stackTrace) {
      loading = false;
      notifyListeners();
      print(stackTrace.toString());
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.toString() + "${model.items[0].itemRef}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: XColors.primaryColor,
      ));
    });
  }

  Future cartPayment(
      {String cvv,
      String exp,
      String cardNum,
      String pin,
      BuildContext context}) async {
    loading = true;
    notifyListeners();
    UserModel model = await getUser();
    Cardd card = Cardd(
      cvv: cvv,
      expiryMonth: exp.split("/").first,
      expiryYear: exp.split("/").last,
      number: cardNum,
    );
    Metadata dat = Metadata(
      customFields: [],
    );
    ChargeClass chargeClass = ChargeClass(
      amount: totalCost.toString(),
      card: card,
      email: model.email,
      pin: pin,
      metadata: dat,
    );
    payMyMoney(chargeClass).then((value) async {
      await saveResponse(value, context);
      await placeOrder(context);
    }).onError((error, stackTrace) {
      loading = false;
      notifyListeners();
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

  Future saveResponse(ChargeResponse res, context) {
    FirebaseFirestore.instance
        .collection("invoice")
        .doc()
        .set(res.toJson())
        .then((value) {
      print("it works");
    }).onError((error, stackTrace) {
      print(error);
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
