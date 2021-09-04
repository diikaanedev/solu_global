import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class PeopleTypeSearchPhoneWidget extends StatefulWidget {
  @override
  _PeopleTypeSearchPhoneWidgetState createState() =>
      _PeopleTypeSearchPhoneWidgetState();
}

class _PeopleTypeSearchPhoneWidgetState
    extends State<PeopleTypeSearchPhoneWidget> {
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
            Container(
              width: constraints.maxWidth * .12,
              height: constraints.maxWidth * .12,
              decoration: BoxDecoration(
                  color: cons.noir(),
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://www.wallpapertip.com/wmimgs/141-1418814_bhojpuri-actress-hd-wallpaper-photo-image-sanchita-banerjee.jpg',
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(constraints.maxWidth)),
            ),
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Container(
              width: constraints.maxWidth * .5,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                      width: constraints.maxWidth * .5,
                      child: Text(
                        'Seydina Issa Laye Kane',
                        style: TextStyle(fontSize: constraints.maxHeight * .25),
                      )),
                  Container(
                      width: constraints.maxWidth * .5,
                      child: Text(
                        '@diikaanedev',
                        style: TextStyle(fontSize: constraints.maxHeight * .2),
                      )),
                  Spacer(),
                ],
              ),
              // color: cons.rose(),
            )
          ],
        ),
      );
}
