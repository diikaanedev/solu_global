import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class TYpeSearchItemPhoneWidget extends StatefulWidget {
  final String text;
  final bool isValid;

  const TYpeSearchItemPhoneWidget(
      {Key? key, required this.text, required this.isValid})
      : super(key: key);
  @override
  _TYpeSearchItemPhoneWidgetState createState() =>
      _TYpeSearchItemPhoneWidgetState();
}

class _TYpeSearchItemPhoneWidgetState extends State<TYpeSearchItemPhoneWidget> {
  late ConstantByDii cons;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

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
              height: constraints.maxHeight * .1,
            ),
            if (widget.isValid)
              Container(
                height: constraints.maxHeight * .03,
                color: cons.noir(),
              ),
            Spacer(),
          ],
        ),
      );
}
