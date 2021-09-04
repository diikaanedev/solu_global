import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopHomeNavSearchAddWidget extends StatefulWidget {
  @override
  _TopHomeNavSearchAddWidgetState createState() =>
      _TopHomeNavSearchAddWidgetState();
}

class _TopHomeNavSearchAddWidgetState extends State<TopHomeNavSearchAddWidget> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Container(
              width: constraints.maxWidth * .75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Recherchez',
                      icon: Icon(CupertinoIcons.search,
                          color: colorsByDii.eerieBlack())),
                  cursorColor: colorsByDii.eerieBlack(),
                  textAlign: TextAlign.justify,
                ),
              ),
              decoration: BoxDecoration(
                  color: colorsByDii.lightGray(),
                  borderRadius:
                      BorderRadius.circular(constraints.maxHeight * .05)),
            ),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/rs-add-post-stories'),
              child: Card(
                elevation: 5,
                shadowColor: colorsByDii.white(),
                color: colorsByDii.sizzlingRed(),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * .2)),
                child: Container(
                  width: constraints.maxWidth * .12,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * .2)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.add,
                      size: constraints.maxHeight * .6,
                      color: colorsByDii.white(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
