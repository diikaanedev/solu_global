import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class CardBagProduit extends StatefulWidget {
  final String urlTof, produitName;
  final Color colorBg;

  const CardBagProduit({Key key, this.urlTof, this.produitName, this.colorBg})
      : super(key: key);

  @override
  _CardBagProduitState createState() => _CardBagProduitState();
}

class _CardBagProduitState extends State<CardBagProduit> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .9,
          width: size.width,
          // child: Image.asset(widget.urlTof),
        ),
        Positioned(
            left: size.width * .1,
            top: size.height * .03,
            child: Container(
              // height: size.height * .1,
              // width: size.width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: widget.colorBg),
              child: Text(
                '  ${widget.produitName}  ',
                style: TextStyle(
                    fontFamily: 'Cinzel',
                    color: Constant.BLANC(),
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              // color: Constant.GRIS(),
            )),
        Positioned(
            top: 15,
            right: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Constant.BLUE()
              ),
              child: Center(
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 50,
                  color: Constant.BLUE(),
                ),
              ),
            )),
        Positioned(
            top: size.height * .1,
            left: size.width * .1,
            child: Container(
                height: size.height * .4,
                width: size.width * .8,
                // color: Constant.ROUGE(),
                decoration: BoxDecoration(
                    // color: widget.colorBg,
                    image: DecorationImage(
                        image: AssetImage(widget.urlTof),
                        fit: BoxFit.contain)))),
      ],
    );
  }
}
