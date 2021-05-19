import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/utils/envConfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Presentation/Pages/HomePage/HomePage.dart';
import 'Presentation/Pages/Onboarding/onboarding.dart';
import 'Presentation/Pages/Onboarding/splashscreen.dart';
import 'Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'data/network/API/APICalling/GetProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(create: (_)=> HomePageViewModel()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
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
        SizeConfig.init(context, width: size.width, height: size.height, allowFontScaling: true);
        return HomePage();
      }),
    );
  }
}