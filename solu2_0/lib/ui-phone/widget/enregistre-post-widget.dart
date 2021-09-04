import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class EnregistrePostWidget extends StatefulWidget {
  @override
  _EnregistrePostWidgetState createState() => _EnregistrePostWidgetState();
}

class _EnregistrePostWidgetState extends State<EnregistrePostWidget> {
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
            Icon(Icons.bookmark_border,
                size: constraints.maxWidth * .3, color: cons.noir()),
            Spacer(),
          ],
        ),
      );
}
