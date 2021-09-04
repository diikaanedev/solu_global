import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class TopNavShop extends StatefulWidget {
  final String nameShop;
  final String logoShop;

  const TopNavShop({Key key, this.nameShop, this.logoShop}) : super(key: key);
  @override
  _TopNavShopState createState() => _TopNavShopState();
}

class _TopNavShopState extends State<TopNavShop> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .05,
          ),
          Container(
            height: size.height * .05,
            width: size.width * .2,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.logoShop))),
          ),
          SizedBox(
            width: size.width * .05,
          ),
          Container(
            height: size.height * .05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Constant.BLUE()),
            child: Center(
              child: Text(
                '  ${widget.nameShop}  ',
                style: TextStyle(
                    fontFamily: 'Satisfy',
                    fontSize: 35,
                    color: Constant.BLANC()),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
