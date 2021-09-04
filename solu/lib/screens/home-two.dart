import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/best-produit-list-item.dart';
import 'package:solu/widgets/best-shop-list.dart';
import 'package:solu/widgets/best-shop-widget.dart';
import 'package:solu/widgets/top-nav.dart';

class HomeScreenTwo extends StatefulWidget {
  @override
  _HomeScreenTwoState createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
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
                height: size.height * .9,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'Best Shop'.toUpperCase(),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Constant.BLUE()),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .04,
                      width: size.width,
                      // color: Constant.ROUGE(),
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: listeBestShop()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      // color: Constant.ROUGE(),
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
                        images: [
                          BestShopWiget(
                            logo: 'assets/images/logo_carre.png',
                            produitTof: 'assets/images/carre.jpg',
                          ),
                          BestShopWiget(
                            logo: 'assets/images/logo_missionnaire.png',
                            produitTof: 'assets/images/polo1.png',
                          ),
                          BestShopWiget(
                            logo: 'assets/images/logo_6.9.png',
                            produitTof: 'assets/images/wax.png',
                          ),
                          BestShopWiget(
                            logo: 'assets/images/logo-jongoma.png',
                            produitTof: 'assets/images/robe6.png',
                          ),
                          BestShopWiget(
                            logo: 'assets/images/heritage_logo.png',
                            produitTof: 'assets/images/robe5.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'Best Produits'.toUpperCase(),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                                fontFamily: 'Cinzel',
                                fontWeight: FontWeight.w100,
                                color: Constant.BLUE()),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .25,
                      width: size.width,
                      // color: Constant.ROUGE(),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          BestProduitListItem(
                            urlTof: 'assets/images/shoes_nike1.png',
                            colorBg: Constant.ORANGE(),
                            prix: '35,000',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BestProduitListItem(
                            urlTof: 'assets/images/shoes_nike2.png',
                            colorBg: Constant.VERT(),
                            prix: '57,000',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BestProduitListItem(
                            urlTof: 'assets/images/polo1.png',
                            colorBg: Constant.ROUGE(),
                            prix: '22,000',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BestProduitListItem(
                            urlTof: 'assets/images/capuchon.png',
                            colorBg: Constant.BLUE(),
                            prix: '12,000',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BestProduitListItem(
                            urlTof: 'assets/images/chemise5.png',
                            colorBg: Constant.JAUNE(),
                            prix: '15,000',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
