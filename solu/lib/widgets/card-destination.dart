import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';

class CardDestinationWidget extends StatefulWidget {
  final String urlTof;
  final String note;
  final String name;

  const CardDestinationWidget({Key key, this.urlTof, this.note, this.name})
      : super(key: key);
  @override
  _CardDestinationWidgetState createState() => _CardDestinationWidgetState();
}

class _CardDestinationWidgetState extends State<CardDestinationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeFourState.setState(() {
          homeFourState.screen = 5;
        });
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(widget.urlTof), fit: BoxFit.cover)),
            ),
            Positioned(
                top: constraints.maxHeight * .6,
                left: constraints.maxWidth * .06,
                child: Container(
                    child: Center(
                  child: Text(
                    '${widget.name}'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(color: Constant.NOIR(), blurRadius: 1)
                        ],
                        color: Constant.BLANC()),
                  ),
                ))),
            Positioned(
                top: constraints.maxWidth * .05,
                right: constraints.maxWidth * .05,
                child: Container(
                  width: constraints.maxWidth * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constant.ORANGE(),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.note,
                        style: TextStyle(
                            color: Constant.BLANC(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        color: Constant.BLANC(),
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
