import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TitreWidgetPhone extends StatefulWidget {
  final String titre;

  const TitreWidgetPhone({Key? key, required this.titre}) : super(key: key);
  @override
  _TitreWidgetPhoneState createState() => _TitreWidgetPhoneState();
}

class _TitreWidgetPhoneState extends State<TitreWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Text(
              widget.titre,
              style: TextStyle(
                  color: colorsByDii.eerieBlack(),
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxWidth * .04),
            )
          ],
        ),
      );
}
