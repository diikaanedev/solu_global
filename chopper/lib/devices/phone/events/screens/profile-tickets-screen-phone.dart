// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/devices/phone/events/widgets/card-tickets-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/top-bar-profile-tickets-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ProfileTicketsScreenPhone extends StatefulWidget {
  @override
  _ProfileTicketsScreenPhoneState createState() =>
      _ProfileTicketsScreenPhoneState();
}

class _ProfileTicketsScreenPhoneState extends State<ProfileTicketsScreenPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
        backgroundColor: colorsByDii.white(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: colorsByDii.white(),
          ),
          Positioned(
              child: Container(
            height: size.height * .07,
            width: size.width,
            child: TopBarProfileTicketsWidgetPhone(),
          )),
          Positioned(
              top: size.height * .07,
              child: Container(
                height: size.height * .05,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .2,
                      ),
                      Text(
                        'Mes billets',
                        style: TextStyle(
                            color: colorsByDii.eerieBlack(),
                            fontSize: constraints.maxHeight * .5),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              top: size.height * .12,
              child: Container(
                height: size.height * .8,
                width: size.width,
                child: Carousel(
                  dotBgColor: Colors.transparent,
                  boxFit: BoxFit.contain,
                  autoplay: false,
                  dotColor: colorsByDii.eerieBlack(),
                  dotIncreasedColor: colorsByDii.grisCulture(),
                  images: [
                    CardTicketsWidgetPhone(
                      data: 'Stempede ticket diikaane',
                      date: 'Samedi 27 Juin 2021',
                      heure: '16h-22h',
                      lieux: 'Canal Olympia',
                      name: 'Film One Piece Stempede',
                      url:
                          'https://assets.change.org/photos/6/bg/on/YabgONrZhpnSKGU-1600x900-noPad.jpg?1571348779',
                    ),
                    CardTicketsWidgetPhone(
                      data: 'Concert show of the year ticket diikaane',
                      date: 'Vendredi 15 Juin 2021',
                      heure: '16h-22h',
                      lieux: 'State Iba Mar Diop',
                      name: 'Show of the years NitDof',
                      url: 'https://www.au-senegal.com/IMG/arton15551.jpg',
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
