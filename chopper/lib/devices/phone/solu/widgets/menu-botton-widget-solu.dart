import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MenuBottomWidgetPhoneSOLU extends StatefulWidget {
  final int screenChoix;

  const MenuBottomWidgetPhoneSOLU({Key? key, required this.screenChoix})
      : super(key: key);
  @override
  _MenuBottomWidgetPhoneSOLUState createState() =>
      _MenuBottomWidgetPhoneSOLUState();
}

class _MenuBottomWidgetPhoneSOLUState extends State<MenuBottomWidgetPhoneSOLU> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            GestureDetector(
              // onTap: () => Navigator.pushNamed(context, '/event-home'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.home_rounded,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 0
                        ? colorsByDii.eerieBlack()
                        : colorsByDii.grisCulture(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .15,
                        color: widget.screenChoix == 0
                            ? colorsByDii.eerieBlack()
                            : colorsByDii.grisCulture()),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              // onTap: () => Navigator.pushNamed(context, '/events'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.link_rounded,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 1
                        ? colorsByDii.eerieBlack()
                        : colorsByDii.grisCulture(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    '??v??nements',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 1
                          ? colorsByDii.eerieBlack()
                          : colorsByDii.grisCulture(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              // onTap: () =>
              // Navigator.pushNamed(context, '/event/memories/follow'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.play_arrow,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 2
                        ? colorsByDii.eerieBlack()
                        : colorsByDii.grisCulture(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Souvenirs',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 2
                          ? colorsByDii.eerieBlack()
                          : colorsByDii.grisCulture(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              // onTap: () => Navigator.pushNamed(context, '/profile'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.person,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 3
                        ? colorsByDii.eerieBlack()
                        : colorsByDii.grisCulture(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 3
                          ? colorsByDii.eerieBlack()
                          : colorsByDii.grisCulture(),
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
