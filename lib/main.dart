import 'package:flutter/material.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/utils/envConfig.dart';

import 'Presentation/Pages/HomePage/HomePage.dart';
import 'Presentation/Pages/Onboarding/splashscreen.dart';

void main() {
  runApp(MyApp());
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