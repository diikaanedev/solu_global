import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarProfileWidgetPhone extends StatefulWidget {
  @override
  _TopBarProfileWidgetPhoneState createState() =>
      _TopBarProfileWidgetPhoneState();
}

class _TopBarProfileWidgetPhoneState extends State<TopBarProfileWidgetPhone> {
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
                  backgroundColor: ColorByDii.blanc(),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorByDii.noir(),
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
                  color: ColorByDii.noir(),
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxWidth * .05),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: CircleAvatar(
                  backgroundColor: ColorByDii.blanc(),
                  child: Center(
                    child: Icon(
                      Icons.message_rounded,
                      color: ColorByDii.noir(),
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
