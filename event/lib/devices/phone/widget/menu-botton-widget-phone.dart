import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class MenuBottomWidgetPhone extends StatefulWidget {
  final int screenChoix;

  const MenuBottomWidgetPhone({Key? key, required this.screenChoix})
      : super(key: key);
  @override
  _MenuBottomWidgetPhoneState createState() => _MenuBottomWidgetPhoneState();
}

class _MenuBottomWidgetPhoneState extends State<MenuBottomWidgetPhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.home_rounded,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 0
                        ? ColorByDii.noir()
                        : ColorByDii.gris(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .15,
                        color: widget.screenChoix == 0
                            ? ColorByDii.noir()
                            : ColorByDii.gris()),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/events'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.link_rounded,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 1
                        ? ColorByDii.noir()
                        : ColorByDii.gris(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Événements',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 1
                          ? ColorByDii.noir()
                          : ColorByDii.gris(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, '/event/memories/follow'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.play_arrow,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 2
                        ? ColorByDii.noir()
                        : ColorByDii.gris(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Souvenirs',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 2
                          ? ColorByDii.noir()
                          : ColorByDii.gris(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.person,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 3
                        ? ColorByDii.noir()
                        : ColorByDii.gris(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 3
                          ? ColorByDii.noir()
                          : ColorByDii.gris(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
