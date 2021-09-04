import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/card-categorie.dart';
import 'package:solu/widgets/top-nav.dart';
import 'package:solu/widgets/top-selling-card.dart';
import 'package:solu/widgets/top-selling-new-card.dart';

class HomeThree extends StatefulWidget {
  @override
  _HomeThreeState createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
  Size size;
  bool showHome = true;
  bool showFavorie = false;
  bool showBag = false;
  bool showProfile = false;
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
                height: size.height,
                width: size.width,
                // color: Constant.BLUE(),
                child: Column(
                  children: [
                    Container(
                      height: size.height * .07,
                      // color: Constant.GRIS(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'Neuf Golden Shop ',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Cinzel',
                                color: Constant.ORANGE()),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .07,
                      width: size.width,
                      // color: Constant.VERT(),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CardCategorie(
                            colorBg: Constant.VERT(),
                            name: 'Chaussure',
                            icon: 'assets/images/icon-basket.png',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CardCategorie(
                            colorBg: Constant.JAUNE(),
                            name: 'Jean Homme',
                            icon: 'assets/images/icon-jean-masculin.png',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CardCategorie(
                            colorBg: Constant.ROUGE(),
                            name: 'Jean Femme',
                            icon: 'assets/images/icon-jean-feminin.png',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width,
                      // color: Constant.VERT(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'Top Selling',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Constant.BLUE()),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .7,
                      width: size.width,
                      // color: Constant.VERT(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          autoplay: false,
                          animationCurve: Curves.easeIn,
                          dotIncreasedColor: Constant.BLANC(),
                          dotSize: 10.0,
                          dotColor: Constant.NOIR(),
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomCenter,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 10.0,
                          dotSpacing: 0.0,
                          images: [
                            Container(
                                height: size.height * .7,
                                width: size.width,
                                child: TopSellingNewCard()),
                            Container(
                                height: size.height * .7,
                                width: size.width,
                                child: TopSellingNewCard()),
                          ],
                        ),
                      ),

                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   physics: BouncingScrollPhysics(),
                      //   children: [
                      //     // TopSellingCard(
                      //     //   name: 'Lacoste Polo',
                      //     //   prix: '3,500',
                      //     //   urlRouge: 'assets/images/lacoste_rouge.png',
                      //     //   urlVert: 'assets/images/polo1.png',
                      //     //   urlJaune: 'assets/images/lacoste_jaune.jpg',
                      //     //   urlBleu: 'assets/images/lacoste_blue.png',
                      //     //   urlMaron: 'assets/images/lacoste_marron.png',
                      //     // ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Container(
                      //         height: size.height * .7,
                      //         width: size.width,
                      //         child: TopSellingNewCard()),

                      // Container(
                      //     height: size.height * .7,
                      //     width: size.width,
                      //     child: TopSellingNewCard()),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     // TopSellingNewCard(),

                      //     // TopSellingCard(
                      //     //   name: 'Lacoste Polo',
                      //     //   prix: '3,500',
                      //     //   urlRouge: 'assets/images/lacoste_rouge.png',
                      //     //   urlVert: 'assets/images/polo1.png',
                      //     //   urlJaune: 'assets/images/lacoste_jaune.jpg',
                      //     //   urlBleu: 'assets/images/lacoste_blue.png',
                      //     //   urlMaron: 'assets/images/lacoste_marron.png',
                      //     // ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
