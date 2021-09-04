import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TopBarHomeWidgetPhone extends StatefulWidget {
  @override
  _TopBarHomeWidgetPhoneState createState() => _TopBarHomeWidgetPhoneState();
}

class _TopBarHomeWidgetPhoneState extends State<TopBarHomeWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            CircleAvatar(
                backgroundColor: colorsByDii.white(),
                child: Center(
                  child: Icon(
                    Icons.menu,
                    color: colorsByDii.eerieBlack(),
                    size: constraints.maxWidth * .07,
                  ),
                ),
                radius: constraints.maxHeight * .4),
            SizedBox(
              width: constraints.maxWidth * .01,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/events'),
              child: CircleAvatar(
                  backgroundColor: colorsByDii.eerieBlack(),
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
