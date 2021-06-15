import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Domain/ProductModel.dart';
import 'package:zia/Domain/firebaseModel.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/cart_page/cartpage.dart';
import 'package:zia/Presentation/Pages/menu/menu.dart';
import 'package:zia/Presentation/Pages/product_info/product_info.dart';
import 'package:zia/Presentation/Pages/upload_page/uploadpage.dart';
import 'package:zia/Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'package:zia/Presentation/ViewModel/homepage_stream/homestream.dart';
import 'package:zia/Presentation/Views/Catalog.dart';
import 'package:zia/Presentation/Views/homepageview.dart';
import 'package:zia/data/network/API/APICalling/GetProduct.dart';
import 'package:zia/data/network/FireBase/User/fire_user.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/button.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;
  UserModel user;
  List<String> catalogWidget = [
    "Electronics",
    "Jewelery",
    "Men's Clothing",
    "Women's Clothing",
  ];

  @override
  void initState() {
    super.initState();
    print("test");
    context.read<HomePageViewModel>().getList("electronics");
    test();
    //print(user.fullName);
  }

  Future<void> test() async {
    user = await getUser();
  }

  SizeConfig config = new SizeConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: XButton(
        onClick: () {
          getProduct();
        },
/*        onClick: () => navigate(context, UploadPage()),*/
        text: "Go to Cart",
        textColor: Colors.white,
        height: config.sh(50),
        width: SizeConfig.screenWidthDp,
        buttonColor: XColors.primaryColor,
        radius: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: SizeConfig.screenHeightDp,
        width: SizeConfig.screenWidthDp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YMargin(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/ziaIcon.png",
                      scale: 2.5,
                    ),
                    NormalText(
                      text: "When we said diverse catalogs, we meant it",
                      textColor: Colors.black,
                      fontSize: 12,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    navigate(
                        context,
                        Menu(
                          model: user,
                        ));
                  },
                  child: Container(
                      height: config.sh(50),
                      width: config.sw(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage("assets/images/userPH.png"),
                        image: NetworkImage(
                            "https://static.wikia.nocookie.net/kubera/images/3/3a/3-188_Yaksha.png/revision/latest/scale-to-width-down/310?cb=20210413055331",
                            scale: 2),
                      )),
                ),
              ],
            ),
            YMargin(25),
            Container(
              height: config.sh(35),
              width: SizeConfig.screenWidthDp,
              child: ListView.builder(
                itemCount: catalogWidget.length,
                itemBuilder: (context, index) {
                  return Catalogs(
                    catalogTitle: catalogWidget[index],
                    index: index,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            YMargin(20),
            TitleText(
              text: "Trending!!!",
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            NormalText(
              text: "Here are trending items under this Category",
              textColor: Colors.black.withOpacity(0.5),
            ),
            YMargin(20),
            Container(
              height: config.sh(200),
              child: Consumer<HomePageViewModel>(
                builder: (context, notifier, child) {
                  if (notifier.error == true) {
                    return Container(
                      child: Center(
                        child: NormalText(
                          text: "ERROR",
                          textColor: Colors.red,
                        ),
                      ),
                    );
                  }
                  if (notifier.pList != null) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: notifier.pList.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                navigate(
                                    context,
                                    ProductInfo(
                                      model: notifier.pList.list[index],
                                    ));
                              },
                              child: HomePageWidget(
                                model: notifier.pList.list[index],
                              ));
                        });
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/loading.gif"),
                      )),
                    );
                  }
                },
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> list = snapshot.data.docs
                      .map((e) => ProductModel.fromSnapshot(e))
                      .toList();
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              navigate(
                                  context,
                                  ProductInfo(
                                    model: list[index],
                                  ));
                            },
                            child: HomePageWidget(
                              model: list[index],
                            ));
                      });
                }
                return Container();
              },
            ),
            YMargin(10),
            Row(
              children: [
                NormalText(
                  text: "Yeah, you wanna see more cool stuff?",
                  textColor: Colors.black.withOpacity(0.5),
                ),
                NormalText(
                  text: "Get Premium",
                  textColor: XColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            YMargin(10),
          ],
        ),
      )),
    );
  }
}
