import 'package:chopper/devices/phone/events/widgets/edit-about-profile-params-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/edit-name-profile-params-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/edit-telephone-profile-params-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/profile-params-avatar-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ProfileParamsScreenPhone extends StatefulWidget {
  @override
  _ProfileParamsScreenPhoneState createState() =>
      _ProfileParamsScreenPhoneState();
}

class _ProfileParamsScreenPhoneState extends State<ProfileParamsScreenPhone> {
  ColorsByDii colorsByDii = ColorsByDii();

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorsByDii.white(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorsByDii.white(),
        title: Text(
          'Paramètres',
          style: TextStyle(color: colorsByDii.eerieBlack()),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: colorsByDii.eerieBlack()),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              top: size.height * .05,
              child: Container(
                height: size.height * .2,
                width: size.width,
                child: ProfileParamsAvatarWidgetPhone(),
              )),
          Positioned(
              top: size.height * .25,
              child: Container(
                height: size.height * .75,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        height: size.height * .1,
                        width: size.width,
                        child: EditNameProfileParamsWidgetPhone()),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        height: size.height * .1,
                        width: size.width,
                        child: EditAboutProfileParamsWidgetPhone()),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        height: size.height * .1,
                        width: size.width,
                        child: EditTelephoneProfileParamsWidgetPhone()),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
