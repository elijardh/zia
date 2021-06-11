import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zia/Presentation/ViewModel/Catalog/CatalogVM.dart';
import 'package:zia/Presentation/ViewModel/HomePageViewModel/HomePageViewModel.dart';
import 'package:zia/utils/colors.dart';
import 'package:zia/utils/size_config.dart';
import 'package:zia/widgets/texts.dart';

class Catalogs extends StatefulWidget {
  final String catalogTitle;
  final int index;
  Catalogs({this.catalogTitle, this.index});
  @override
  _CatalogsState createState() => _CatalogsState();
}

class _CatalogsState extends State<Catalogs> {
  Color color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final SizeConfig config = new SizeConfig();
  @override
  Widget build(BuildContext context) {
    var test = context.watch<CatalogVM>().currIndex;
    return InkWell(
      onTap: () {
        context.read<CatalogVM>().update(widget.index);
        context
            .read<HomePageViewModel>()
            .getList(widget.catalogTitle.toLowerCase());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          height: 5,
          width: config.sw(100),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: test == widget.index ? XColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: NormalText(
              text: widget.catalogTitle,
              textColor: test == widget.index ? Colors.white : Colors.black,
              maxLines: 2,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
