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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool isScrolled){
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                pinned: true,
                snap: false,
                floating: true,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.close_fullscreen_outlined, color: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  IconButton(icon: Icon(Icons.image), onPressed: null),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  IconButton(icon: Icon(Icons.favorite, color: XColors.primaryColor,), onPressed: null),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network("",fit: BoxFit.fill,),
                  collapseMode: CollapseMode.parallax,
                ),
              )
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YMargin(100),
                      TitleText(
                        text: widget.model.title,
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      YMargin(20),
                      NormalText(
                        text: widget.model.description,
                        textColor: Colors.black.withOpacity(0.6),
                        maxLines: 1000,
                      ),
                      YMargin(50),
                      NormalText(
                        text: "Price",
                        textColor: XColors.primaryColor,
                      ),
                      YMargin(150),


                    ],
                  ),
                ),
                XButton(
                  text: "ADD T0 CART",
                  textColor: Colors.white,
                  height: config.sh(50),
                  width: SizeConfig.screenWidthDp,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
