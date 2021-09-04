import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/top-nav-profile.dart';

class DetailsDestinationsPage extends StatefulWidget {
  @override
  _DetailsDestinationsPageState createState() =>
      _DetailsDestinationsPageState();
}

class _DetailsDestinationsPageState extends State<DetailsDestinationsPage> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Constant.BLANC(),
            )),
        Positioned(
            top: 0,
            child: Container(
              height: size.height * .07,
              width: size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Container(
                    width: size.width * .3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/radisoonlogo.png'))),
                  )
                ],
              ),
            )),
        Positioned(
            top: size.height * .1,
            child: Container(
              height: size.height,
              width: size.width,
              color: Constant.BLANC(),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [],
              ),
            )),
      ],
    );
  }
}
