import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarProfileWidgetPhone extends StatefulWidget {
  @override
  _TopBarProfileWidgetPhoneState createState() =>
      _TopBarProfileWidgetPhoneState();
}

class _TopBarProfileWidgetPhoneState extends State<TopBarProfileWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                  backgroundColor: colorsByDii.white(),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: colorsByDii.eerieBlack(),
                      size: constraints.maxWidth * .07,
                    ),
                  ),
                  radius: constraints.maxHeight * .4),
            ),
            SizedBox(
              width: constraints.maxWidth * .01,
            ),
            Spacer(),
            Text(
              'Profile',
              style: TextStyle(
                  color: colorsByDii.eerieBlack(),
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxWidth * .05),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: CircleAvatar(
                  backgroundColor: colorsByDii.white(),
                  child: Center(
                    child: Icon(
                      Icons.message_rounded,
                      color: colorsByDii.eerieBlack(),
                      size: constraints.maxWidth * .07,
                    ),
                  ),
                  radius: constraints.maxHeight * .4),
            ),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
          ],
        ),
      );
}
