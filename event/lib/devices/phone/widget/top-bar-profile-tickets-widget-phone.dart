import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarProfileTicketsWidgetPhone extends StatefulWidget {
  @override
  _TopBarProfileTicketsWidgetPhoneState createState() =>
      _TopBarProfileTicketsWidgetPhoneState();
}

class _TopBarProfileTicketsWidgetPhoneState
    extends State<TopBarProfileTicketsWidgetPhone> {
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
            Text(
              'Back',
              style: TextStyle(
                  fontSize: constraints.maxHeight * .3,
                  color: ColorByDii.noir()),
            )
          ],
        ),
      );
}
