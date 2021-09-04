import 'package:flutter/material.dart';
import 'package:solu/model/shop-model.dart';
import 'package:solu/utils/constant.dart';

class GoFollow extends StatefulWidget {
  final shopModel shop;

  const GoFollow({Key key, this.shop}) : super(key: key);
  @override
  _GoFollowState createState() => _GoFollowState();
}

class _GoFollowState extends State<GoFollow> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .07,
      width: size.width * .8,
      child: Row(
        children: [
          Spacer(),
          Text(
            ' Go  Follow  ',
            style: TextStyle(
                color: Constant.BLANC(),
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          // Text(
          //   '${widget.shop.name}',
          //   style: TextStyle(
          //       color: Constant.BLANC(),
          //       fontSize: 12,
          //       fontFamily: 'Cinzel',
          //       fontWeight: FontWeight.w300),
          // ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_right_outlined,
            size: 40,
            color: Constant.BLANC(),
          ),
          Spacer(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.shop.colorBg,
      ),
    );
  }
}
