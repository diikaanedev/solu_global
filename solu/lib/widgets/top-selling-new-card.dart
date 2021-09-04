import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class TopSellingNewCard extends StatefulWidget {
  @override
  _TopSellingNewCardState createState() => _TopSellingNewCardState();
}

class _TopSellingNewCardState extends State<TopSellingNewCard> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * .93,
              width: constraints.maxWidth,
              // color: Constant.GRIS(),
            ),
            Positioned(
                child: Container(
              child: Container(
                height: constraints.maxHeight * .93,
                width: constraints.maxWidth,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Card(
                  elevation: 2,
                  color: Constant.GRIS(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            )),
            Positioned(
                // top: 10,
                left: 3.5,
                child: Container(
                  height: constraints.maxHeight * .8,
                  width: constraints.maxWidth,
                  // color: Colors.red,
                  child: Center(
                      child: Image.asset('assets/images/lacoste_marron.png')),
                  // color: Constant.ROUGE(),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(image: AssetImage(''))),
                )),
            Positioned(
                right: 10,
                top: constraints.maxHeight * .15,
                child: Container(
                  height: constraints.maxHeight * .4,
                  width: 30,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text('XS'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.GRIS(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text('S'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.GRIS(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text('M'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: .5, color: Constant.NOIR()),
                          color: Constant.GRIS(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text('L'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.GRIS(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Text('XL'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.GRIS(),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
            Positioned(
                left: 10,
                top: constraints.maxHeight * .15,
                child: Container(
                  height: constraints.maxHeight * .4,
                  width: 30,
                  // color: Constant.BLANC(),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.JAUNE(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.ROUGE(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.BLUE(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.VERT(),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Constant.ORANGE(),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
            Positioned(
                right: 10,
                top: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  // color: Colors.red,
                  child: Center(
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                )),
            Positioned(
                bottom: constraints.maxHeight * .075,
                left: 3.5,
                child: Container(
                  height: constraints.maxHeight * .25,
                  width: constraints.maxWidth * .98,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .11,
                        width: constraints.maxWidth * .93,

                        // color: Constant.JAUNE(),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: constraints.maxHeight * .03,
                              width: constraints.maxWidth * .93,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                  Text(
                                    'Shirts',
                                    style: TextStyle(
                                      color: Constant.GRIS().withOpacity(.7),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$650',
                                    style: TextStyle(
                                      color: Constant.GRIS().withOpacity(.7),
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            Container(
                              height: constraints.maxHeight * .07,
                              width: constraints.maxWidth * .93,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                  Text(
                                    'Blue Stripped oversize',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$ 25.90',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                ],
                              ),
                              // color: Colors.red,
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .12,
                        // color: Constant.JAUNE(),
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              width: constraints.maxWidth * .35,
                              // color: Colors.red,
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    width: constraints.maxWidth * .1,
                                    // color: Colors.yellow,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Icon feather-minus-square.png'))),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: constraints.maxWidth * .1,
                                    // color: Colors.yellow,
                                    child: Center(
                                        child: Text(
                                      '10',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: constraints.maxWidth * .1,
                                    // color: Colors.yellow,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Icon feather-plus-square.png'))),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              // color: Colors.red,
                              width: constraints.maxWidth * .45,
                              height: constraints.maxHeight * .1,

                              child: Center(
                                child: Text(
                                  'Add to bag',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Constant.BLANC()),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Constant.BLUE(),
                                  borderRadius: BorderRadius.circular(
                                      constraints.maxWidth * .1)),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Constant.BLANC(),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )),
                )),
          ],
        );
      },
    );
  }
}
