import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class CardProduitCartPage extends StatefulWidget {
  @override
  _CardProduitCartPageState createState() => _CardProduitCartPageState();
}

class _CardProduitCartPageState extends State<CardProduitCartPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              // color: Constant.JAUNE(),
            ),
            Positioned(
                top: constraints.maxHeight * .1,
                left: constraints.maxWidth * .2,
                child: Container(
                  height: constraints.maxHeight * .8,
                  width: constraints.maxWidth * .3,
                  // color: Constant.BLUE(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage('assets/images/shoes5.jpeg'),
                          fit: BoxFit.fill)),
                )),
            Positioned(
                top: constraints.maxHeight * .1,
                left: constraints.maxWidth * .5,
                child: Container(
                  height: constraints.maxHeight * .8,
                  width: constraints.maxWidth * .55,
                  // color: Constant.ROUGE(),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .2,
                        // color: Constant.ROUGE(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .01,
                            ),
                            Text(
                              'Nike Shoes red lion',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: constraints.maxHeight * .2,
                        // color: Constant.ROUGE(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Text('color'),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Constant.ROUGE()),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Text('size'),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              child: Center(
                                child: Text(
                                  'M',
                                  style: TextStyle(fontSize: 6),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Constant.NOIR()),
                                  color: Constant.BLANC()),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: constraints.maxHeight * .2,
                        // color: Constant.ROUGE(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Text(
                              'FCFA ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Constant.NOIR()),
                            ),
                            Text(
                              '15,000',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Constant.NOIR()),
                            ),
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .2,
                left: constraints.maxWidth * .125,
                child: Container(
                  height: constraints.maxHeight * .8,
                  width: constraints.maxWidth * .1,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .2,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            // color: Constant.GRIS(),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Icon feather-plus-square.png'))),
                      ),
                      Container(
                        height: constraints.maxHeight * .25,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Constant.GRIS(),
                        ),
                        child: Center(child: Text('10')),
                      ),
                      Container(
                        height: constraints.maxHeight * .2,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            // color: Constant.GRIS(),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Icon feather-minus-square.png'))),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Constant.GRIS(),
                  ),
                )),
          ],
        );
      },
    );
  }
}
