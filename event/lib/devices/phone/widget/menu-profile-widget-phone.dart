import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class MenuProfileWidgetPhone extends StatefulWidget {
  final String titreMenu;
  final IconData icon;
  final Function onpress;

  const MenuProfileWidgetPhone(
      {Key? key,
      required this.titreMenu,
      required this.icon,
      required this.onpress})
      : super(key: key);
  @override
  _MenuProfileWidgetPhoneState createState() => _MenuProfileWidgetPhoneState();
}

class _MenuProfileWidgetPhoneState extends State<MenuProfileWidgetPhone> {
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
                color: ColorByDii.noir(),
                size: constraints.maxHeight * .4,
              ),
              SizedBox(
                width: constraints.maxWidth * .03,
              ),
              Text(
                '${widget.titreMenu}',
                style: TextStyle(
                    fontSize: constraints.maxHeight * .25,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorByDii.noir(),
                size: constraints.maxHeight * .3,
              ),
              SizedBox(
                width: constraints.maxWidth * .05,
              ),
            ],
          ),
        ),
      );
}
