import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';

class FeedWidgetCard extends StatefulWidget {
  final String url;

  const FeedWidgetCard({Key key, this.url}) : super(key: key);
  @override
  _FeedWidgetCardState createState() => _FeedWidgetCardState();
}

class _FeedWidgetCardState extends State<FeedWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Constant.GRIS().withOpacity(.3))
                  ]),
              child: Card(
                elevation: 2,
                shadowColor: Constant.BLANC(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              // color: Constant.VERT(),
            ),
            Positioned(
                top: constraints.maxHeight * .03,
                child: Container(
                  height: constraints.maxHeight * .08,
                  width: constraints.maxWidth,
                  // color: Constant.MARON_DUR(),
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .05,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeFourState.setState(() {
                            homeFourState.screen = 4;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .13,
                          decoration: BoxDecoration(
                              // color: Constant.JAUNE(),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/carre.jpg'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * .15)),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: constraints.maxWidth * .13,
                        child: Center(
                          child: Icon(Icons.more_horiz),
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      )
                    ],
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .12,
                left: constraints.maxWidth * .14,
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .85,
                  // color: Constant.JAUNE(),
                  decoration: BoxDecoration(
                      color: Constant.MARON_DUR(),
                      image: DecorationImage(
                          image: AssetImage(widget.url), fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )),
                )),
            Positioned(
                bottom: 10,
                left: constraints.maxWidth * .14,
                child: Container(
                  height: constraints.maxHeight * .16,
                  width: constraints.maxWidth * .85,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .1,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                                '👉 A light-weight Emoji 📦 for Flutter with all up-to-date emojis 😄. Made from 💯% ☕ with ❤️!'),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .05,
                        // color: Constant.JAUNE(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            Icon(Icons.favorite_border),
                            SizedBox(
                              width: 3,
                            ),
                            Text('236'),
                            SizedBox(
                              width: constraints.maxWidth * .07,
                            ),
                            Icon(Icons.comment),
                            SizedBox(
                              width: 3,
                            ),
                            Text('236'),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      // color: Constant.MARON_DUR(),
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  )),
                ))
          ],
        );
      },
    );
  }
}
