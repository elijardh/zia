import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zia/Domain/seller_order_model.dart';
import 'package:zia/Domain/user_Model.dart';
import 'package:zia/Presentation/Pages/specific_order_page/specificorderpage.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/navigator.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("buyerID",
            isEqualTo: FirebaseFirestore.instance.doc("users/${user.uid}"),
          ).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData){
              List<SellerOrderModel> list = snapshot.data.docs.map((e) => SellerOrderModel.fromSnapShot(e)).toList();
              return Container(
                height: SizeConfig.screenHeightDp,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                  return FutureBuilder(
                    future:FirebaseFirestore.instance.doc(list[index].buyer.path).get(),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        UserModel model = UserModel(
                          email: snapshot.data["email"],
                          fullName: snapshot.data["fullname"],
                          pass: "",
                          phoneNumber: snapshot.data["phoneNumber"],
                        );
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            onTap: (){
                              navigate(context, SpecificOrderPage(
                                items: list[index].items.items,
                                model: model,
                              ));
                            },
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      tileColor: XColors.primaryColor.withOpacity(0.2),
                      title: NormalText(text: "Order From ${model.fullName}",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: NormalText(text: "Total cost of Orders of is £${list[index].totalCost}"),
                    trailing: Icon(Icons.circle_notifications_sharp,color: list[index].status == false? Colors.red : Colors.green,),
                    ),
                        );
                      }
                      else{
                        return Container();
                      }
                    },
                  );
                }),
              );
            }
            else if(!snapshot.hasData){
              return Container(
                child: Center(child: TitleText(text: "No Order",),),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
