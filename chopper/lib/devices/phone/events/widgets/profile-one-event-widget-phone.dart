import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ProfileOneEventWidgetPhone extends StatefulWidget {
  final List<String> user;

  const ProfileOneEventWidgetPhone({Key? key, required this.user})
      : super(key: key);
  @override
  _ProfileOneEventWidgetPhoneState createState() =>
      _ProfileOneEventWidgetPhoneState();
}

class _ProfileOneEventWidgetPhoneState
    extends State<ProfileOneEventWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            CircleAvatar(
                radius: constraints.maxHeight * .6,
                backgroundImage: NetworkImage(widget.user[0])),
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Text(
              widget.user[1],
              style: TextStyle(
                  fontSize: constraints.maxHeight * .3,
                  fontWeight: FontWeight.w500,
                  color: colorsByDii.eerieBlack()),
            ),
            Spacer(),
            Text('${widget.user[2]} evenements '),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
          ],
        ),
      );
}
