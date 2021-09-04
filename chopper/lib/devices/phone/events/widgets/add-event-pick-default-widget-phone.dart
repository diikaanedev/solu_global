import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class AddEventPickDefaultWidgetPhone extends StatefulWidget {
  final bool isActive;
  final String url;

  const AddEventPickDefaultWidgetPhone(
      {Key? key, required this.isActive, required this.url})
      : super(key: key);
  @override
  _AddEventPickDefaultWidgetPhoneState createState() =>
      _AddEventPickDefaultWidgetPhoneState();
}

class _AddEventPickDefaultWidgetPhoneState
    extends State<AddEventPickDefaultWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorsByDii.eerieBlack(),
                  image: DecorationImage(
                      image: NetworkImage(widget.url), fit: BoxFit.cover)),
            ),
            Positioned(
                right: constraints.maxWidth * .05,
                top: constraints.maxHeight * .05,
                child: Container(
                  height: constraints.maxHeight * .2,
                  width: constraints.maxWidth * .2,
                  child: CircleAvatar(
                      backgroundColor: !widget.isActive
                          ? colorsByDii.eerieBlack()
                          : colorsByDii.white()),
                ))
          ],
        ),
      );
}
