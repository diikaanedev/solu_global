import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class FavoriePostWidget extends StatefulWidget {
  @override
  _FavoriePostWidgetState createState() => _FavoriePostWidgetState();
}

class _FavoriePostWidgetState extends State<FavoriePostWidget> {
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
            Icon(Icons.favorite_border_outlined,
                size: constraints.maxWidth * .3, color: cons.noir()),
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Text(
              '230',
              style: TextStyle(
                  fontSize: constraints.maxWidth * .2, color: cons.noir()),
            ),
            Spacer(),
          ],
        ),
      );
}
