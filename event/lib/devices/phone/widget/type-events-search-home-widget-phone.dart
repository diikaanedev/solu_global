import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class TypeEventsSearchHomeWidgetPhone extends StatefulWidget {
  final String text;
  final bool isValid;

  const TypeEventsSearchHomeWidgetPhone(
      {Key? key, required this.text, required this.isValid})
      : super(key: key);
  @override
  _TypeEventsSearchHomeWidgetPhoneState createState() =>
      _TypeEventsSearchHomeWidgetPhoneState();
}

class _TypeEventsSearchHomeWidgetPhoneState
    extends State<TypeEventsSearchHomeWidgetPhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Spacer(),
            Text(
              widget.text,
              style: TextStyle(
                  fontWeight:
                      widget.isValid ? FontWeight.bold : FontWeight.w100),
            ),
            SizedBox(
              height: constraints.maxHeight * .02,
            ),
            if (widget.isValid)
              Container(
                height: constraints.maxHeight * .03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorByDii.noir(),
                ),
              ),
          ],
        ),
      );
}
