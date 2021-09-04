import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class MenuAppBtn extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  final int choix;

  const MenuAppBtn({Key? key, required this.choix}) : super(key: key);
  _MenuAppBtnState createState() => _MenuAppBtnState();
}

class _MenuAppBtnState extends State<MenuAppBtn> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Row(
      children: [
        Spacer(),
        Card(
          elevation: widget.choix == 0 ? 1 : 0,
          shadowColor: ColorByDii.gris(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Container(
            height: size.height * .05,
            width: size.width * .3,
            child: Center(
              child: Text(
                '  Réseaux Social  ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          elevation: widget.choix == 1 ? 1 : 0,
          shadowColor: ColorByDii.gris(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Container(
            height: size.height * .05,
            width: size.width * .3,
            child: Center(
              child: Text(
                '  Événements  ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          elevation: widget.choix == 2 ? 1 : 0,
          shadowColor: ColorByDii.gris(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Container(
            height: size.height * .05,
            width: size.width * .3,
            child: Center(
              child: Text(
                '  Solu2.0  ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
