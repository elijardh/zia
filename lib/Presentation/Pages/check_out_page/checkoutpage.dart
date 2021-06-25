import 'package:flutter/material.dart';
import 'package:zia/Presentation/ViewModel/cart_vm/cartVM.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class CheckOutPage extends StatefulWidget {
  final String cost;
  CheckOutPage({this.cost});
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SizeConfig config = SizeConfig();
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController cardCtrl = TextEditingController();
  TextEditingController cardExp = TextEditingController();
  TextEditingController cardCvv = TextEditingController();
  TextEditingController cardPin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: config.sh(460),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                SizedBox(
                  height: config.sh(100),
                  width: SizeConfig.screenWidthDp,
                  child: XTextField(
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
                ),
                YMargin(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: config.sh(100),
                      width: SizeConfig.screenWidthDp * 0.35,
                      child: XTextField(
                          controller: cardExp,
                          hintText: "Card exp month/year",
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "This cannot be empty";
                            }
                            return null;
                          }),
                    ),
                    SizedBox(
                      height: config.sh(100),
                      width: SizeConfig.screenWidthDp * 0.3,
                      child: XTextField(
                          controller: cardCvv,
                          hintText: "Card CVV",
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "This cannot be empty";
                            }
                            return null;
                          }),
                    )
                  ],
                ),
                YMargin(5),
                SizedBox(
                  height: config.sh(100),
                  width: SizeConfig.screenWidthDp,
                  child: XTextField(
                      controller: cardPin,
                      hintText: "Card Pin",
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return "This cannot be empty";
                        }
                        return null;
                      }),
                ),
                YMargin(5),
                XButton(
                  isLoading: context.watch<CartVM>().loading,
                  width: SizeConfig.screenWidthDp,
                  onClick: () {
                    if (_formKey.currentState.validate()) {
                      context.read<CartVM>().cartPayment(
                          cardNum: cardCtrl.text,
                          context: context,
                          cvv: cardCvv.text,
                          exp: cardExp.text,
                          pin: cardPin.text);
                    }
                  },
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
      ),
    );
  }
}
