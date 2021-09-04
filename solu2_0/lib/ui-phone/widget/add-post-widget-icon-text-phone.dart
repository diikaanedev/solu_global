import 'package:flutter/widgets.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class AddPOstWidgetIconTextPhone extends StatefulWidget {
  final IconData iconData;
  final String text;

  const AddPOstWidgetIconTextPhone(
      {Key? key, required this.iconData, required this.text})
      : super(key: key);
  @override
  _AddPOstWidgetIconTextPhoneState createState() =>
      _AddPOstWidgetIconTextPhoneState();
}

class _AddPOstWidgetIconTextPhoneState
    extends State<AddPOstWidgetIconTextPhone> {
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
            Spacer(),
            Container(
              width: constraints.maxWidth * .15,
              child: Icon(
                widget.iconData,
                size: constraints.maxWidth * .1,
                color: cons.noir(),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * .03,
            ),
            Container(
              width: constraints.maxWidth * .7,
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: constraints.maxWidth * .07, color: cons.noir()),
              ),
            ),
            Spacer(),
          ],
        ),
      );
}
