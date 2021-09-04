import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class ShopName extends StatefulWidget {
  final String nameShop;

  const ShopName({Key key, this.nameShop}) : super(key: key);

  @override
  _ShopNameState createState() => _ShopNameState();
}

class _ShopNameState extends State<ShopName> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .04,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Text(
        '${widget.nameShop}',
        style: TextStyle(
            fontFamily: 'Cinzel',
            decoration: TextDecoration.underline,
            fontSize: 26,
            color: Constant.BLUE(),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
