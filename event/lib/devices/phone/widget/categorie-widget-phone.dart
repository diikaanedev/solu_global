import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieWidgetPhone extends StatefulWidget {
  final String url;
  final String text;

  const CategorieWidgetPhone({Key? key, required this.url, required this.text})
      : super(key: key);
  @override
  _CategorieWidgetPhoneState createState() => _CategorieWidgetPhoneState();
}

class _CategorieWidgetPhoneState extends State<CategorieWidgetPhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Spacer(),
            CircleAvatar(
              backgroundColor: ColorByDii.noir(),
              radius: constraints.maxWidth * .3,
              backgroundImage: NetworkImage(widget.url),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: constraints.maxWidth * .12,
                  color: ColorByDii.noir(),
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      );
}
