import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MenuProfileWidgetPhone extends StatefulWidget {
  final String titreMenu;
  final IconData icon;
  final Function onpress;

  final Color color;

  const MenuProfileWidgetPhone(
      {Key? key,
      required this.titreMenu,
      required this.icon,
      required this.color,
      required this.onpress})
      : super(key: key);
  @override
  _MenuProfileWidgetPhoneState createState() => _MenuProfileWidgetPhoneState();
}

class _MenuProfileWidgetPhoneState extends State<MenuProfileWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onpress(),
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
              Icon(
                widget.icon,
                color: widget.color,
                size: constraints.maxWidth * .07,
              ),
              SizedBox(
                width: constraints.maxWidth * .03,
              ),
              Text(
                '${widget.titreMenu}',
                style: TextStyle(
                    fontSize: constraints.maxWidth * .035,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorsByDii.eerieBlack(),
                size: constraints.maxWidth * .03,
              ),
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
            ],
          ),
        ),
      );
}
