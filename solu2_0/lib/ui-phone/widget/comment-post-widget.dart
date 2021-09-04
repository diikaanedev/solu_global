import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class CommentPostWidget extends StatefulWidget {
  @override
  _CommentPostWidgetState createState() => _CommentPostWidgetState();
}

class _CommentPostWidgetState extends State<CommentPostWidget> {
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
            Icon(Icons.messenger_outline_rounded,
                size: constraints.maxWidth * .3, color: cons.noir()),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Text(
              '40',
              style: TextStyle(
                  fontSize: constraints.maxWidth * .2, color: cons.noir()),
            ),
            Spacer(),
          ],
        ),
      );
}
