import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class TitreTYpeSearchPhoneWidget extends StatefulWidget {
  final String text;

  const TitreTYpeSearchPhoneWidget({Key? key, required this.text})
      : super(key: key);
  @override
  _TitreTYpeSearchPhoneWidgetState createState() =>
      _TitreTYpeSearchPhoneWidgetState();
}

class _TitreTYpeSearchPhoneWidgetState
    extends State<TitreTYpeSearchPhoneWidget> {
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
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.bold, color: cons.gris()),
            ),
            Spacer(),
          ],
        ),
      );
}
