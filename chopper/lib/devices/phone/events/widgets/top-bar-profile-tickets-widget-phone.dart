import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarProfileTicketsWidgetPhone extends StatefulWidget {
  @override
  _TopBarProfileTicketsWidgetPhoneState createState() =>
      _TopBarProfileTicketsWidgetPhoneState();
}

class _TopBarProfileTicketsWidgetPhoneState
    extends State<TopBarProfileTicketsWidgetPhone> {
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
            Text(
              'Back',
              style: TextStyle(
                  fontSize: constraints.maxHeight * .3,
                  color: colorsByDii.eerieBlack()),
            )
          ],
        ),
      );
}
