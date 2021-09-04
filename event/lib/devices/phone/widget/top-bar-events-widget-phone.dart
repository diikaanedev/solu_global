import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarEventsWidgetPhone extends StatefulWidget {
  @override
  _TopBarEventsWidgetPhoneState createState() =>
      _TopBarEventsWidgetPhoneState();
}

class _TopBarEventsWidgetPhoneState extends State<TopBarEventsWidgetPhone> {
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
              'Events',
              style: TextStyle(
                  color: ColorByDii.noir(),
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxWidth * .05),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: CircleAvatar(
                  backgroundColor: ColorByDii.noir(),
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/dd/f6/0d/ddf60d1f007753160df98e83958d6abd.jpg'),
                  radius: constraints.maxHeight * .4),
            ),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
          ],
        ),
      );
}
