import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CommentExploreWigdetRS extends StatefulWidget {
  @override
  _CommentExploreWigdetRSState createState() => _CommentExploreWigdetRSState();
}

class _CommentExploreWigdetRSState extends State<CommentExploreWigdetRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth * .2,
                child: Center(
                    child: CircleAvatar(
                  radius: constraints.maxWidth * .2,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/09/38/4e/09384e25a400a0291e65cb1ac2968ef5.jpg'),
                ))),
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth * .8,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                      height: constraints.maxHeight * .35,
                      width: constraints.maxWidth * .8,
                      child: Text(
                        'jean Walton',
                        style: TextStyle(
                            color: colorsByDii.lightGray(),
                            fontSize: constraints.maxWidth * .04,
                            shadows: [
                              Shadow(
                                  blurRadius: 2,
                                  offset: Offset(2, 5),
                                  color: colorsByDii.white()),
                              Shadow(
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                  color: colorsByDii.raisinBlack()),
                            ],
                            fontWeight: FontWeight.w300),
                      )),
                  Spacer(),
                  Container(
                      width: constraints.maxWidth * .8,
                      height: constraints.maxHeight * .5,
                      child: Text(
                        'Awsome love it ',
                        style: TextStyle(
                            color: colorsByDii.white(),
                            fontSize: constraints.maxWidth * .05,
                            shadows: [
                              Shadow(
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                  color: colorsByDii.white()),
                              Shadow(
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                  color: colorsByDii.raisinBlack()),
                            ],
                            fontWeight: FontWeight.bold),
                      )),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      );
}
