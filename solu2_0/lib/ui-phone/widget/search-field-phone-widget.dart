import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class SearchFieldPhoneWidget extends StatefulWidget {
  @override
  _SearchFieldPhoneWidgetState createState() => _SearchFieldPhoneWidgetState();
}

class _SearchFieldPhoneWidgetState extends State<SearchFieldPhoneWidget> {
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
              width: constraints.maxWidth * .9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: cons.noir(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      icon: Icon(
                        Icons.search,
                        size: constraints.maxWidth * .07,
                        color: cons.gris(),
                      )),
                ),
              ),
              decoration: BoxDecoration(
                  color: cons.gris().withOpacity(.2),
                  borderRadius:
                      BorderRadius.circular(constraints.maxWidth * .02)),
            ),
            Spacer(),
          ],
        ),
      );
}
