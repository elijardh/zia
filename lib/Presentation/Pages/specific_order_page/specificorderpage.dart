import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/order_items.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/send_order_page/sendorderpage.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';

class SpecificOrderPage extends StatefulWidget {
  final List<OrderItem> items;
  final DocumentReference ref;
  final UserModel model;
  SpecificOrderPage({this.items, this.model, this.ref});
  @override
  _SpecificOrderPageState createState() => _SpecificOrderPageState();
}

class _SpecificOrderPageState extends State<SpecificOrderPage> {

  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: XButton(onClick: (){
        navigate(context, SendOrderPage(
          ref: widget.ref,
        ));
      }, text: "Send Order",textColor: Colors.white,radius: 5,buttonColor: XColors.primaryColor,
      width: SizeConfig.screenWidthDp,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
              leading: IconButton(
          icon: Icon(
            Icons.close_fullscreen_outlined,
            color: XColors.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeightDp * 0.6,
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (context, index)
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    tileColor: index % 2 == 1? XColors.primaryColor.withOpacity(0.3) : XColors.primaryColor.withOpacity(0.6),
                    title: NormalText(text: "${widget.items[index].itemName}",),
                    subtitle: NormalText(text: "${widget.items[index].itemQuantity} at ${widget.items[index].itemPrice} each",),
                  ),
                );
              }),),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: config.sh(80),
                child: ListTile(
                  tileColor: Colors.white.withOpacity(0.5),
                  title: RichText(text: TextSpan(
                    text: "Buyer's name:  ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "${widget.model.fullName}",
                        style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ]
                  )),
                  subtitle: RichText(text: TextSpan(
                    text: "Buyer's Phone number:  ",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      TextSpan(
                        text: "${widget.model.phoneNumber}",
                        style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ]
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}