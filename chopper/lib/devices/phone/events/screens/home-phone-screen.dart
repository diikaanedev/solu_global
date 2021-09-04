import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/menu-btn-app.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homePhoneScreenEVENT extends StatefulWidget {
  const homePhoneScreenEVENT({Key? key}) : super(key: key);

  @override
  _homePhoneScreenEVENTState createState() => _homePhoneScreenEVENTState();
}

// ignore: camel_case_types
class _homePhoneScreenEVENTState extends State<homePhoneScreenEVENT> {
  late Size size;
  ColorsByDii colorsByDii = ColorsByDii();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
        backgroundColor: colorsByDii.white(),
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            // color: colorsByDii.sizzlingRed(),
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: size.height * .07,
                  width: size.width,
                  child: MenuAppBtn(choix: 1),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
