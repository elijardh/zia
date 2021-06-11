import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Presentation/ViewModel/cart_vm/cartVM.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/x_margin.dart';
import 'package:zia/widgets/y_margin.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  SizeConfig config = SizeConfig();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartVM>().addToList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: NormalText(
              text: "Cart",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: XColors.primaryColor,
            ),
          ),
        ],
        elevation: 0,
      ),
      bottomSheet: XButton(
        onClick: null,
        text: "CHECK OUT",
        textColor: Colors.white,
        height: config.sh(50),
        width: SizeConfig.screenWidthDp,
        buttonColor: XColors.primaryColor,
        radius: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer<CartVM>(
          builder: (context, notifier, child) {
            notifier.getTotalCost();
            if (notifier.listModels.isNotEmpty) {
              return Container(
                height: SizeConfig.screenHeightDp,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Doodle.png",
                  ),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                            text: "You have ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: notifier.listModels.length.toString(),
                                style: TextStyle(
                                    color: XColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: " Items in your cart")
                            ])),
                    Container(
                      height: SizeConfig.screenHeightDp - 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: SizedBox(
                              width: config.sw(30),
                              child: Text(
                                notifier.listModels[index].name,
                                maxLines: 10,
                                softWrap: true,
                                //textScaleFactor: 0.65,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            subtitle: Text(
                              "£ ${notifier.listModels[index].price.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            leading: Icon(
                              Icons.shopping_cart,
                            ),
                            trailing: Container(
                              width: config.sw(80),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      notifier.increaseAmount(index);
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Text("${notifier.listModels[index].amount}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: XColors.primaryColor)),
                                  GestureDetector(
                                    onTap: () {
                                      notifier.decreasesAmount(index);
                                    },
                                    child: Text("-",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  )
                                ],
                              ),
                            ),
/*                          trailing: Text(
                                "${notifier.listModels[index].amount.toString()} pieces"),*/
                          );
                        },
                        itemCount: notifier.listModels.length,
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Total Price:",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text:
                                  context.watch<CartVM>().totalCost.toString(),
                              style: TextStyle(
                                color: XColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ))
                        ])),
                  ],
                ),
              );
            } else if (notifier.listModels.isEmpty) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/errorocuured.png"),
                      NormalText(
                        text: "There is nothing to see here",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      NormalText(
                        text: "Add products if you wanna purchase",
                        textColor: Colors.black.withOpacity(0.7),
                        fontSize: 16,
                      ),
                      YMargin(50),
                      NormalText(
                        text: "Go to products",
                        fontSize: 20,
                        textColor: XColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: XColors.primaryColor,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
