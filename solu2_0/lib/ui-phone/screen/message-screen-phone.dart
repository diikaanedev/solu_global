import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/home-button-nav-bar-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class MessageScreenPhone extends StatefulWidget {
  @override
  _MessageScreenPhoneState createState() => _MessageScreenPhoneState();
}

class _MessageScreenPhoneState extends State<MessageScreenPhone> {
  late ConstantByDii cons;
  late Size size;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: cons.blanc(),
          ),
          Positioned(
              bottom: size.height * .02,
              left: size.width * .1,
              child: Container(
                height: size.height * .05,
                width: size.width * .8,
                child: HomeButtonNavBarWidget(
                  intChoix: 3,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cons.noir(),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: cons.grisFonce())
                    ]),
              ))
        ],
      ),
    );
  }
}
