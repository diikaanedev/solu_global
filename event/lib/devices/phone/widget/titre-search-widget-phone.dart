import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class TitreSearchWidgetPhone extends StatefulWidget {
  final String text;

  const TitreSearchWidgetPhone({Key? key, required this.text})
      : super(key: key);
  @override
  _TitreSearchWidgetPhoneState createState() => _TitreSearchWidgetPhoneState();
}

class _TitreSearchWidgetPhoneState extends State<TitreSearchWidgetPhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Spacer(),
            Text(
              widget.text,
              style: TextStyle(
                  color: ColorByDii.gris(),
                  fontSize: constraints.maxHeight * .4),
            ),
            Spacer()
          ],
        ),
      );
}
