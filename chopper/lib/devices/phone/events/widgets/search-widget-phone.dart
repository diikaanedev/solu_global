import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidgetPhone extends StatefulWidget {
  @override
  _SearchWidgetPhoneState createState() => _SearchWidgetPhoneState();
}

class _SearchWidgetPhoneState extends State<SearchWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            Container(
              width: constraints.maxWidth * .9,
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      height: constraints.maxHeight,
                      child: Center(
                          child: Icon(
                        Icons.search,
                        color: colorsByDii.white(),
                        size: constraints.maxWidth * .05,
                      ))),
                  Spacer(),
                  Container(
                    width: constraints.maxWidth * .65,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search Events'),
                      showCursor: false,
                    ),
                  ),
                  Spacer(),
                  Container(
                      height: constraints.maxHeight,
                      child: Center(
                          child: Icon(
                        Icons.close,
                        color: colorsByDii.white(),
                        size: constraints.maxWidth * .05,
                      ))),
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(constraints.maxWidth * .2),
                  color: colorsByDii.grisCulture()),
            ),
            Spacer(),
          ],
        ),
      );
}
