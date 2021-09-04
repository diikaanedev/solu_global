import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class TitleSloganWidget extends StatefulWidget {
  @override
  _TitleSloganWidgetState createState() => _TitleSloganWidgetState();
}

class _TitleSloganWidgetState extends State<TitleSloganWidget> {
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
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
              child: Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      width: constraints.maxWidth * .7,
                      child: Text(
                        'Solu2.0',
                        style: TextStyle(
                            fontSize: constraints.maxHeight * .25,
                            color: cons.blanc(),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * .05,
                    ),
                    Container(
                      width: constraints.maxWidth * .7,
                      child: Text(
                        'Sensei community app from djolof youssoupha !',
                        style: TextStyle(
                            fontSize: constraints.maxHeight * .1,
                            color: cons.blanc(),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
