import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'package:zia/Presentation/Views/Catalog.dart';
import 'package:zia/Presentation/Views/homepageview.dart';
import 'package:zia/data/network/API/APICalling/GetProduct.dart';
import 'package:zia/data/network/FireBase/User/fire_user.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
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
  User user;
  List<String> catalogWidget = ["Electronics","Jewelery","Men's Clothing","Women's Clothing",];
  @override
  void initState(){
    super.initState();
    context.read<HomePageViewModel>().getList("electronics");
    FireUser fireUser = new FireUser();
    user = fireUser.getUser();
    setState(() {
      name = hello();
      print(name);
    });
  }

  String hello(){
    FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: user.email)
        .limit(1)
        .get().then((value) {
       if(value.docs.length > 0){
         Map<String, dynamic> name = value.docs[0].data();
         String hell = name["email"];
         return hell;
       }
    });
    return null;
  }

  GetProducts getProduct = new GetProducts();
  SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Container(
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
                        Image.asset("assets/images/ziaIcon.png", scale: 2.5,),
                        NormalText(
                          text: "When we said diverse catalogs, we meant it",
                          textColor: Colors.black,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    Container(
                      height: config.sh(50),
                      width: config.sw(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: NormalText(
                        text: name != null ? name : "hello",
                        textColor: Colors.black,
                      ), /*Icon(Icons.person, color: Colors.black,)*/
                    ),
                  ],
                ),
                YMargin(25),
                Container(
                  height: config.sh(35),
                  width: SizeConfig.screenWidthDp,
                  child: ListView.builder(
                    itemCount: catalogWidget.length,
                    itemBuilder: (context, index){
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
                  text: "Trending!",
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
                    builder: (context, notifier,child){
                      if(notifier.pList != null){
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: notifier.pList.list.length,
                            itemBuilder: (context, index){
                              return HomePageWidget(model: notifier.pList.list[index],);
                            });
                      }
                      else{
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/loading.gif"),
                            )
                          ),
                        );
                      }
                  },),
                ),
                YMargin(10),
                Row(
                  children: [
                    NormalText(
                      text:"Yeah, you wanna see more cool stuff?",
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
          )
        ),
      )
    );
  }
}
