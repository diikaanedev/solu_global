import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBottomWidgetPhone extends StatefulWidget {
  final int screenChoix;

  const MenuBottomWidgetPhone({Key? key, required this.screenChoix})
      : super(key: key);
  @override
  _MenuBottomWidgetPhoneState createState() => _MenuBottomWidgetPhoneState();
}

class _MenuBottomWidgetPhoneState extends State<MenuBottomWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
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
                    CupertinoIcons.home,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 0
                        ? colorsByDii.raisinBlack()
                        : colorsByDii.lightGray(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .15,
                        color: widget.screenChoix == 0
                            ? colorsByDii.raisinBlack()
                            : colorsByDii.lightGray()),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/rs-explore'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    CupertinoIcons.collections,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 1
                        ? colorsByDii.raisinBlack()
                        : colorsByDii.lightGray(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 1
                          ? colorsByDii.raisinBlack()
                          : colorsByDii.lightGray(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/rs-discussions'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    CupertinoIcons.conversation_bubble,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 2
                        ? colorsByDii.raisinBlack()
                        : colorsByDii.lightGray(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Discussions',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 2
                          ? colorsByDii.raisinBlack()
                          : colorsByDii.lightGray(),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/rs-profile'),
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    CupertinoIcons.profile_circled,
                    size: constraints.maxWidth * .07,
                    color: widget.screenChoix == 3
                        ? colorsByDii.raisinBlack()
                        : colorsByDii.lightGray(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Text(
                    'Profiles',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * .15,
                      color: widget.screenChoix == 3
                          ? colorsByDii.raisinBlack()
                          : colorsByDii.lightGray(),
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
