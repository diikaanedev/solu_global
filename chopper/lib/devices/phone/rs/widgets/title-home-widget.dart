import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TitleHomeWidget extends StatefulWidget {
  final String titre;

  const TitleHomeWidget({Key? key, required this.titre}) : super(key: key);
  @override
  _TitleHomeWidgetState createState() => _TitleHomeWidgetState();
}

class _TitleHomeWidgetState extends State<TitleHomeWidget> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Text(
              '${widget.titre}',
              style: TextStyle(
                  fontSize: constraints.maxHeight * .5,
                  fontWeight: FontWeight.bold,
                  color: colorsByDii.eerieBlack()),
            )
          ],
        ),
      );
}
