import 'package:event/devices/phone/widget/choice-memory-event-widget-phone.dart';
import 'package:event/devices/phone/widget/menu-botton-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class MemoriesForMeEventsScreenPhone extends StatefulWidget {
  @override
  _MemoriesForMeEventsScreenPhoneState createState() =>
      _MemoriesForMeEventsScreenPhoneState();
}

class _MemoriesForMeEventsScreenPhoneState
    extends State<MemoriesForMeEventsScreenPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        toolbarHeight: .0,
        backgroundColor: ColorByDii.blanc(),
      ),
      backgroundColor: ColorByDii.blanc(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: ColorByDii.blanc(),
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: size.height * .01,
                ),
                Container(
                  height: size.height * .05,
                  width: size.width * .9,
                  child: ChoiceMemoryEventWidgetPhone(
                    actif: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorByDii.gris(),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: ColorByDii.blanc(), boxShadow: [
            BoxShadow(color: ColorByDii.blanc(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 2,
          )),
    );
  }
}
