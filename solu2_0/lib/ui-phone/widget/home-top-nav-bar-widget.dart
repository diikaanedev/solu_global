import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class HomeTopNavBarWidget extends StatefulWidget {
  @override
  _HomeTopNavBarWidgetState createState() => _HomeTopNavBarWidgetState();
}

class _HomeTopNavBarWidgetState extends State<HomeTopNavBarWidget> {
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
              width: constraints.maxWidth * .03,
            ),
            Container(
              width: constraints.maxWidth * .6,
              child: Text(
                'Solu2.0',
                style: TextStyle(
                    fontSize: constraints.maxWidth * .07,
                    fontWeight: FontWeight.bold,
                    color: cons.noir()),
              ),
            ),
            Spacer(),
            Container(
              width: constraints.maxWidth * .15,
              child: Center(
                child: Icon(
                  Icons.notifications,
                  size: constraints.maxWidth * .07,
                  color: cons.noir(),
                ),
              ),
            ),
          ],
        ),
      );
}
