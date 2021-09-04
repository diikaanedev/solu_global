import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class BestShopWiget extends StatefulWidget {
  final String logo;
  final String produitTof;

  const BestShopWiget({Key key, this.logo, this.produitTof}) : super(key: key);
  @override
  _BestShopWigetState createState() => _BestShopWigetState();
}

class _BestShopWigetState extends State<BestShopWiget> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .4,
          width: size.width,
          color: Constant.BLANC(),
        ),
        Positioned(
            top: size.height * .05,
            child: Container(
                height: size.height * .3,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.produitTof),
                        fit: BoxFit.contain)))),
        Positioned(
            left: 10,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.logo))),
            )),
        Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Constant.ORANGE(),
                  borderRadius: BorderRadius.circular(75)),
              child: Icon(
                Icons.arrow_right_outlined,
                size: 40,
                color: Constant.BLANC(),
              ),
            )),
      ],
    );
  }
}
