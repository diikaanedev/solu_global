import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MenuAppBtn extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  final int choix;

  const MenuAppBtn({Key? key, required this.choix}) : super(key: key);
  _MenuAppBtnState createState() => _MenuAppBtnState();
}

class _MenuAppBtnState extends State<MenuAppBtn> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.popAndPushNamed(context, '/'),
              child: Card(
                elevation: widget.choix == 0 ? 1 : 0,
                shadowColor: colorsByDii.white(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .3,
                  child: Center(
                    child: Text(
                      '  Mbedd Bi  ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colorsByDii.eerieBlack()),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.popAndPushNamed(context, '/event-home'),
              child: Card(
                elevation: widget.choix == 1 ? 1 : 0,
                shadowColor: colorsByDii.white(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .3,
                  child: Center(
                    child: Text(
                      '  Événements  ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colorsByDii.eerieBlack()),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.popAndPushNamed(context, '/solu-home'),
              child: Card(
                elevation: widget.choix == 2 ? 1 : 0,
                shadowColor: colorsByDii.white(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .3,
                  child: Center(
                    child: Text(
                      '  Solu2.0  ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: colorsByDii.eerieBlack()),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
