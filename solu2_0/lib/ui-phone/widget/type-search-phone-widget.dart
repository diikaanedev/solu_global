import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/type-search-item-phone-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class TypeSearchPhoneWidget extends StatefulWidget {
  @override
  _TypeSearchPhoneWidgetState createState() => _TypeSearchPhoneWidgetState();
}

class _TypeSearchPhoneWidgetState extends State<TypeSearchPhoneWidget> {
  late ConstantByDii cons;
  int i = 0;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  i = 0;
                });
              },
              child: Container(
                width: constraints.maxWidth * .1,
                child: TYpeSearchItemPhoneWidget(text: 'Tout', isValid: i == 0),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  i = 1;
                });
              },
              child: Container(
                width: constraints.maxWidth * .19,
                child: TYpeSearchItemPhoneWidget(
                    text: 'Personnes', isValid: i == 1),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  i = 2;
                });
              },
              child: Container(
                width: constraints.maxWidth * .1,
                child:
                    TYpeSearchItemPhoneWidget(text: 'Posts', isValid: i == 2),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  i = 3;
                });
              },
              child: Container(
                width: constraints.maxWidth * .13,
                child:
                    TYpeSearchItemPhoneWidget(text: 'Photos', isValid: i == 3),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  i = 4;
                });
              },
              child: Container(
                width: constraints.maxWidth * .13,
                child:
                    TYpeSearchItemPhoneWidget(text: 'Events', isValid: i == 4),
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
