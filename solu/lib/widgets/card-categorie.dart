import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class CardCategorie extends StatefulWidget {
  final String icon;
  final String name;
  final Color colorBg;

  const CardCategorie({Key key, this.icon, this.name, this.colorBg})
      : super(key: key);
  @override
  _CardCategorieState createState() => _CardCategorieState();
}

class _CardCategorieState extends State<CardCategorie> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .07,
      child: Center(
        child: Container(
          height: size.height * .05,
          decoration: BoxDecoration(
              // color: widget.colorBg,
              border: Border.all(color: widget.colorBg),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.icon))),
              ),
              Text(
                widget.name,
                style: TextStyle(
                    fontSize: 14,
                    color: Constant.BLUE(),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
