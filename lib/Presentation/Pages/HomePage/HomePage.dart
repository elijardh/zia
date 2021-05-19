import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Domain/ProductListModel.dart';
import 'package:zia/Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'package:zia/Presentation/Views/Catalog.dart';
import 'package:zia/Presentation/Views/homepageview.dart';
import 'package:zia/data/network/API/APICalling/GetProduct.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';
import 'package:zia/widgets/y_margin.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage({this.name});
  @override
  _HomePageState createState() => _HomePageState(name: name);
}

class _HomePageState extends State<HomePage> {

  List<Catalogs> catalogWidget = [
    Catalogs(catalogTitle: "Electronics",),
    Catalogs(catalogTitle: "Jewelery",),
    Catalogs(catalogTitle: "Men Clothing",),
    Catalogs(catalogTitle: "Women Clothing",),
  ];
  @override
  void initState(){
    super.initState();
    context.read<HomePageViewModel>().getList("electronics");
  }
  Future<dynamic>test() async{
    return await getProduct.getList("electronics");
  }
  final String name;
  _HomePageState({this.name});
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
                        text: "Dare",
                      ), /*Icon(Icons.person, color: Colors.black,)*/
                    ),
                  ],
                ),
                YMargin(25),
                Container(
                  height: config.sh(35),
                  width: SizeConfig.screenWidthDp,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: catalogWidget,
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
                              return HomePageWidget(
                                image: notifier.pList.list[index].image,
                                cost: notifier.pList.list[index].price.toString(),
                              );
                            });
                      }
                      else{
                        return Container();
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
