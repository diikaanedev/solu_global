import 'package:flutter/material.dart';
import 'package:solu/model/shop-model.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/go-follow.dart';

class MarkWidgetHome extends StatefulWidget {
  final shopModel shop;

  const MarkWidgetHome({Key key, this.shop}) : super(key: key);
  @override
  _MarkWidgetHomeState createState() => _MarkWidgetHomeState();
}

class _MarkWidgetHomeState extends State<MarkWidgetHome> {
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
                  color: widget.shop.colorBg),
              child: Text(
                '  ${widget.shop.name}  ',
                style: TextStyle(
                    fontFamily: 'Cinzel',
                    color: Constant.BLANC(),
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
              // color: Constant.GRIS(),
            )),
        Positioned(
            top: size.height * .1,
            child: Container(
                height: size.height * .6,
                width: size.width,
                // color: Constant.ROUGE(),
                decoration: BoxDecoration(
                    // color: widget.colorBg,
                    image: DecorationImage(
                        image: AssetImage(widget.shop.urlTofPhare),
                        fit: BoxFit.contain)))),
        Positioned(
            bottom: size.height * .07,
            left: size.width * .1,
            child: GoFollow(
              shop: widget.shop,
            )),
      ],
    );
  }
}
