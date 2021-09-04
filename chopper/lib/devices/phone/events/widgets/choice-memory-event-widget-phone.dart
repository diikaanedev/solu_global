import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ChoiceMemoryEventWidgetPhone extends StatefulWidget {
  final int actif;

  const ChoiceMemoryEventWidgetPhone({Key? key, required this.actif})
      : super(key: key);
  @override
  _ChoiceMemoryEventWidgetPhoneState createState() =>
      _ChoiceMemoryEventWidgetPhoneState();
}

class _ChoiceMemoryEventWidgetPhoneState
    extends State<ChoiceMemoryEventWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .005,
            ),
            Container(
              width: constraints.maxWidth * .495,
              height: constraints.maxHeight * .98,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/event/memories/follow'),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Suivre',
                      style: TextStyle(
                          color: widget.actif == 0
                              ? colorsByDii.eerieBlack()
                              : colorsByDii.eerieBlack().withOpacity(.3),
                          fontWeight: FontWeight.bold,
                          fontSize: constraints.maxHeight * .4),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .01,
                    ),
                    CircleAvatar(
                      radius: constraints.maxWidth * .03,
                      backgroundColor: widget.actif == 0
                          ? Colors.blue
                          : colorsByDii.eerieBlack().withOpacity(.3),
                      child: Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                              color: colorsByDii.white(),
                              fontSize: constraints.maxWidth * .03),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: widget.actif == 0
                      ? colorsByDii.white()
                      : colorsByDii.grisCulture(),
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              width: constraints.maxWidth * .495,
              height: constraints.maxHeight * .98,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/event/memories/for-me'),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Pour moi',
                      style: TextStyle(
                          color: widget.actif == 1
                              ? colorsByDii.eerieBlack()
                              : colorsByDii.eerieBlack().withOpacity(.3),
                          fontWeight: FontWeight.bold,
                          fontSize: constraints.maxHeight * .4),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .01,
                    ),
                    CircleAvatar(
                      radius: constraints.maxWidth * .03,
                      backgroundColor: widget.actif == 1
                          ? Colors.blue
                          : colorsByDii.eerieBlack().withOpacity(.3),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: colorsByDii.white(),
                              fontSize: constraints.maxWidth * .03),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: widget.actif == 1
                      ? colorsByDii.white()
                      : colorsByDii.grisCulture(),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: constraints.maxWidth * .005,
            ),
          ],
        ),
      );
}
