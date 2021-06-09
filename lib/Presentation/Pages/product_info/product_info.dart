import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class ProductInfo extends StatefulWidget {
  final ProductModel model;

  ProductInfo({this.model});
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomSheet: XButton(
            text: "ADD T0 CART",
            textColor: Colors.white,
            height: config.sh(50),
            width: SizeConfig.screenWidthDp,
            buttonColor: XColors.primaryColor,
          ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  elevation: 0,
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
                    Padding(padding: EdgeInsets.only(left: 10)),
                    IconButton(
                        icon: Icon(
                          Icons.image,
                          color: XColors.primaryColor,
                        ),
                        onPressed: null),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: XColors.primaryColor,
                        ),
                        onPressed: null),
                  ],
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                      var top = constraint.biggest.height;
                      return FlexibleSpaceBar(
                        centerTitle: false,
                        background: Image.network(
                          widget.model.image,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                )
              ];
            },
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(10),
                    NormalText(
                      text: widget.model.title,
                      textColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      maxLines: 3,
                    ),
                    YMargin(20),
                    NormalText(
                      text: widget.model.description,
                      textColor: Colors.black.withOpacity(0.6),
                      maxLines: 1000,
                    ),
                    YMargin(30),
                    NormalText(
                      text: "PRICE",
                      textColor: XColors.primaryColor,
                    ),
                    YMargin(5),
                    TitleText(
                      text: "£ " + widget.model.price.toString(),
                      textColor: Colors.black,
                    ),
                    YMargin(50),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
