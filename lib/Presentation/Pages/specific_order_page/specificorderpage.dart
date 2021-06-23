import 'package:flutter/material.dart';
import 'package:zia/Domain/order_items.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class SpecificOrderPage extends StatefulWidget {
  List<OrderItem> items;
  UserModel model;
  SpecificOrderPage({this.items, this.model});
  @override
  _SpecificOrderPageState createState() => _SpecificOrderPageState();
}

class _SpecificOrderPageState extends State<SpecificOrderPage> {

  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeightDp * 0.8,
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
            }),)
          ],
        ),
      ),
    );
  }
}