import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/card-produit-cart-page.dart';
import 'package:solu/widgets/top-nav-profile.dart';
import 'package:solu/widgets/top-nav.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Constant.BLANC(),
            )),
        Positioned(
            top: size.height * .1,
            child: Container(
              height: size.height * .7,
              width: size.width,
              color: Constant.BLANC(),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: size.height * .2,
                    width: size.width,
                    child: CardProduitCartPage(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width,
                    child: CardProduitCartPage(),
                  ),
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: size.height * .2,
              width: size.width,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    height: size.height * .09,
                    // color: Constant.JAUNE(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Prix Total',
                          style: TextStyle(
                              color: Constant.NOIR(),
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        Spacer(),
                        Text(
                          '150,000 FCFA',
                          style: TextStyle(
                              color: Constant.NOIR(),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Constant.BLANC(),
                  ),
                  Container(
                    height: size.height * .09,
                    // color: Constant.JAUNE(),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          height: size.height * .07,
                          width: size.width * .7,
                          child: Center(
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                  color: Constant.BLANC(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Constant.BLUE(),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              decoration: BoxDecoration(
                  color: Constant.GRIS(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            )),
        Positioned(
            top: 0,
            child: TopNavProfile(
              screen: 0,
              titrePage: 'BAG PAGE',
            )),
      ],
    );
  }
}
