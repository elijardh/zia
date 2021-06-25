import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zia/Presentation/Pages/LoginPage/login.dart';
import 'package:zia/Presentation/ViewModel/send_order_vm/sendodervm.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/utils/envConfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Presentation/Pages/HomePage/HomePage.dart';
import 'Presentation/Pages/Onboarding/onboarding.dart';
import 'Presentation/Pages/Onboarding/splashscreen.dart';
import 'Presentation/Pages/order_page/orderpage.dart';
import 'Presentation/Pages/upload_page/uploadpage.dart';
import 'Presentation/ViewModel/Catalog/CatalogVM.dart';
import 'Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'Presentation/ViewModel/cart_vm/cartVM.dart';
import 'Presentation/ViewModel/login_vm/loginvm.dart';
import 'Presentation/ViewModel/upload_vm/uploadvm.dart';
import 'data/network/API/APICalling/GetProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String mail = pref.get("email");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(
            create: (_) => HomePageViewModel()),
        ChangeNotifierProvider<CatalogVM>(
          create: (_) => CatalogVM(),
        ),
        ChangeNotifierProvider<CartVM>(create: (_) => CartVM()),
        ChangeNotifierProvider<LoginVM>(create: (_) => LoginVM()),
        ChangeNotifierProvider<UploadVM>(create: (_) => UploadVM()),
        ChangeNotifierProvider<SendOrderVM>(
          create: (_) => SendOrderVM(),
        )
      ],
      child: MyApp(
        email: mail,
      )));
}

class MyApp extends StatelessWidget {
  final String email;

  MyApp({this.email});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
/*      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      home: Builder(builder: (BuildContext context) {
        BuildEnvironment.init(flavor: BuildFlavor.development);
        Size size = MediaQuery.of(context).size;
        SizeConfig.init(context,
            width: size.width, height: size.height, allowFontScaling: true);

        return LoginPage();
      }),
    );
  }
}
