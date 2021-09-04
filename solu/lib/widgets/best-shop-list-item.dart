import 'package:flutter/material.dart';
import 'package:solu/model/shop-model.dart';
import 'package:solu/utils/constant.dart';

class BestShopListItem extends StatefulWidget {
  final shopModel shop;

  const BestShopListItem({Key key, this.shop}) : super(key: key);
  @override
  _BestShopListItemState createState() => _BestShopListItemState();
}

class _BestShopListItemState extends State<BestShopListItem> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: widget.shop.colorBg),
      child: Center(
        child: Text(
          '    ${widget.shop.name}    ',
          style: TextStyle(color: Constant.BLANC(), fontFamily: 'Cinzel'),
        ),
      ),
    );
  }
}
