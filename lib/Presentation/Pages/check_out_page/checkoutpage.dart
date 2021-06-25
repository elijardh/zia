import 'package:flutter/material.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class CheckOutPage extends StatefulWidget {
  final String cost;
  CheckOutPage({this.cost});
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  TextEditingController cardCtrl = TextEditingController();
  TextEditingController cardExp = TextEditingController();
  TextEditingController cardCvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close_fullscreen_outlined,
            color: XColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.money_off_csred_outlined,
                    color: XColors.primaryColor,
                  ),
                  NormalText(
                    text: "Pay NGN ${widget.cost}",
                    textColor: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              YMargin(10),
              NormalText(text: "Enter Your Details Below"),
              YMargin(10),
              XTextField(
                controller: cardCtrl,
                fillColor: XColors.primaryColor.withOpacity(0.3),
                hintText: "Type your card number here",
                hintTextColor: Colors.black,
                validator: (value) {
                  if (value.isEmpty || value == null) {
                    return "Enter a card number";
                  }
                  return null;
                },
              ),
              YMargin(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  XTextField(
                      controller: cardExp,
                      hintText: "Card exp month/year",
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "This cannot be empty";
                        }
                        return null;
                      }),
                  XTextField(
                      controller: cardCvv,
                      hintText: "Card CVV",
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "This cannot be empty";
                        }
                        return null;
                      })
                ],
              ),
              YMargin(10),
              XButton(
                onClick: () {},
                text: "Pay",
                buttonColor: XColors.primaryColor,
                radius: 10,
                textColor: Colors.white,
                progressColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
