import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class TopBarAddEventWidget extends StatefulWidget {
  @override
  _TopBarAddEventWidgetState createState() => _TopBarAddEventWidgetState();
}

class _TopBarAddEventWidgetState extends State<TopBarAddEventWidget> {
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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: constraints.maxHeight * .4,
                color: cons.noir(),
              ),
            ),
            Spacer(),
            Text(
              'Create Post',
              style: TextStyle(
                  fontSize: constraints.maxHeight * .4, color: cons.noir()),
            ),
            Spacer(),
            GestureDetector(
              child: Text(
                'Done',
                style: TextStyle(
                    fontSize: constraints.maxHeight * .4, color: cons.noir()),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * .05,
            )
          ],
        ),
      );
}
