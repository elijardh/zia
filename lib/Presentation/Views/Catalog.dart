import 'package:flutter/material.dart';
import 'package:zia/Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class Catalogs extends StatelessWidget {

  final String catalogTitle;
  HomePageViewModel hello = new HomePageViewModel();
  Catalogs({this.catalogTitle});
  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        hello.getList("electronics");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          height: 5,
          width: config.sw(100),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: XColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: NormalText(
              text:catalogTitle,
              textColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
