import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/add-post-widget-phone.dart';
import 'package:solu2_0/ui-phone/widget/home-button-nav-bar-widget.dart';
import 'package:solu2_0/ui-phone/widget/top-bar-add-event-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class AddEventScreenPhone extends StatefulWidget {
  @override
  _AddEventScreenPhoneState createState() => _AddEventScreenPhoneState();
}

class _AddEventScreenPhoneState extends State<AddEventScreenPhone> {
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
              child: Container(
            height: size.height * .05,
            width: size.width,
            child: TopBarAddEventWidget(),
          )),
          Positioned(
              top: size.height * .05,
              child: Container(
                height: size.height * .9,
                width: size.width,
                child: AddPostWidgetPhone(),
              ))
        ],
      ),
    );
  }
}
