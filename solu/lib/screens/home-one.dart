import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/mark-widget-home-list.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:solu/widgets/top-nav.dart';

class HomeOneScreen extends StatefulWidget {
  @override
  _HomeOneScreenState createState() => _HomeOneScreenState();
}

class _HomeOneScreenState extends State<HomeOneScreen> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Constant.BLANC(),
          ),
          Positioned(top: 0, child: TopNav()),
          Positioned(
              top: size.height * .1,
              child: Container(
                height: size.height * .865,
                width: size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: false,
                  animationCurve: Curves.easeIn,
                  dotIncreasedColor: Constant.ORANGE(),
                  dotColor: Constant.NOIR(),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  dotSpacing: 15.0,
                  images: listeMarkHome(),
                ),
              )),
        ],
      ),
    );
  }
}
