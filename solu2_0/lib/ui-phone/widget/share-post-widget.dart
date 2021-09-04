import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class SharePostWidget extends StatefulWidget {
  @override
  _SharePostWidgetState createState() => _SharePostWidgetState();
}

class _SharePostWidgetState extends State<SharePostWidget> {
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
            Icon(Icons.share_outlined,
                size: constraints.maxWidth * .3, color: cons.noir()),
          ],
        ),
      );
}
