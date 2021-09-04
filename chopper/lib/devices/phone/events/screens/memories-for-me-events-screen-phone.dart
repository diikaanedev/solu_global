import 'package:chopper/devices/phone/events/widgets/choice-memory-event-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/menu-botton-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MemoriesForMeEventsScreenPhone extends StatefulWidget {
  @override
  _MemoriesForMeEventsScreenPhoneState createState() =>
      _MemoriesForMeEventsScreenPhoneState();
}

class _MemoriesForMeEventsScreenPhoneState
    extends State<MemoriesForMeEventsScreenPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        toolbarHeight: .0,
        backgroundColor: colorsByDii.white(),
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: colorsByDii.white(),
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
                    color: colorsByDii.grisCulture(),
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
          decoration: BoxDecoration(color: colorsByDii.white(), boxShadow: [
            BoxShadow(color: colorsByDii.white(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 2,
          )),
    );
  }
}
