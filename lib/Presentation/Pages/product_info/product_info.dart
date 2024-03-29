import 'package:flutter/material.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/Domain/cartModel.dart';
import 'package:zia/Presentation/Views/catalog_dialog.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';
import 'package:zia/data/local/database/database.dart';

class ProductInfo extends StatefulWidget {
  final ProductModel model;

  ProductInfo({this.model});
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  addToCart() {
    CartModel cartMod = CartModel(
        objID: widget.model.id.toString(),
        amount: 1,
        price: widget.model.price,
        name: widget.model.title);

    print(cartMod.name);
    //DatabaseProvider.instance.delete();
    DatabaseProvider.instance.addToCart(cartMod).then((value) {
      showDialog(context: context, builder: (_) => CatalogDialog());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: NormalText(
            text: "Item succesfully added to cart",
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: XColors.primaryColor,
        ),
      );
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: NormalText(
          text: e.toString(),
          textColor: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: XColors.primaryColor,
      ));
    });
  }

  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: XButton(
          onClick: () {
            addToCart();
          },
          text: "ADD T0 CART",
          textColor: Colors.white,
          height: config.sh(50),
          width: SizeConfig.screenWidthDp,
          buttonColor: XColors.primaryColor,
          radius: 0,
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
                    return FlexibleSpaceBar(
                      centerTitle: false,
                      background: Image.network(
                        widget.model.image,
                        fit: BoxFit.cover,
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
        ));
  }
}
