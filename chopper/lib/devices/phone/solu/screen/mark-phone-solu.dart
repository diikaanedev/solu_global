import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/devices/phone/solu/screen/mark-phone-solu-2.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkPhoneSOLU extends StatefulWidget {
  final String id;
  const MarkPhoneSOLU({Key? key, required this.id}) : super(key: key);

  @override
  _MarkPhoneSOLUState createState() => _MarkPhoneSOLUState();
}

class _MarkPhoneSOLUState extends State<MarkPhoneSOLU> {
  late Size size;
  ColorsByDii colorsByDii = ColorsByDii();
  Color color = Colors.white;
  Color colorS = Colors.white;
  String nameShop = '';
  String urlShop = '';
  String tel = '';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(MARQUES_COLLECTION)
        .doc(widget.id)
        .get()
        .then((value) {
      String i = value.get('color');
      String j = value.get('colorSecondaire');
      setState(() {
        color = Color.fromRGBO(int.parse(i.split(',')[0]),
            int.parse(i.split(',')[1]), int.parse(i.split(',')[2]), 1);
        colorS = Color.fromRGBO(int.parse(j.split(',')[0]),
            int.parse(j.split(',')[1]), int.parse(j.split(',')[2]), 1);
        nameShop = value.get('name');
        urlShop = value.get('urlLogo');
        tel = value.get('telephone');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: colorsByDii.white(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async => launch("tel:$tel"),
      //   backgroundColor: colorS,
      //   child: Icon(
      //     CupertinoIcons.phone,
      //     color: color,
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          // Positioned(
          //     child: Container(
          //   height: size.height,
          //   width: size.width,
          //   child: ListView(
          //     physics: BouncingScrollPhysics(),
          //     children: [
          //       Container(
          //         height: size.height * .07,
          //         child: LayoutBuilder(
          //           builder:
          //               (BuildContext context, BoxConstraints constraints) {
          //             return Row(
          //               children: [
          //                 SizedBox(
          //                   width: constraints.maxWidth * .02,
          //                 ),
          //                 Container(
          //                   height: constraints.maxHeight,
          //                   width: constraints.maxWidth * .15,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(2),
          //                       image: DecorationImage(
          //                           image: NetworkImage(urlShop))),
          //                 ),
          //                 SizedBox(
          //                   width: constraints.maxWidth * .01,
          //                 ),
          //                 Text(
          //                   nameShop,
          //                   style: TextStyle(
          //                       fontSize: constraints.maxHeight * .3,
          //                       fontWeight: FontWeight.bold,
          //                       color: color),
          //                 ),
          //                 Spacer(),
          //                 Icon(
          //                   Icons.shopping_bag_outlined,
          //                   color: color,
          //                 ),
          //                 SizedBox(
          //                   width: constraints.maxWidth * .02,
          //                 ),
          //               ],
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // )),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(MARQUES_COLLECTION)
                    .doc(widget.id)
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    List d = snapshot.data!.get('images');

                    return Carousel(
                      dotBgColor: Colors.transparent,
                      dotColor: color,
                      dotIncreasedColor: colorS,
                      dotSize: 2,
                      dotIncreaseSize: 3,
                      dotSpacing: 10,
                      dotPosition: DotPosition.bottomRight,
                      autoplayDuration: Duration(seconds: 25),
                      images: d
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(e),
                                        fit: BoxFit.contain)),
                              ))
                          .toList(),
                    );
                  }
                  return Container();
                }),
          )),
          Positioned(
              child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: size.height * .05,
              width: size.width,
              child: LayoutBuilder(
                builder: (context, constraints) => Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: constraints.maxHeight * .3,
                      color: colorsByDii.raisinBlack(),
                    ),
                    Text(
                      'Retour',
                      style: TextStyle(color: colorsByDii.raisinBlack()),
                    )
                  ],
                ),
              ),
            ),
          )),
          Positioned(
              top: size.height * .65,
              child: Container(
                height: size.height * .15,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .05,
                      ),
                      Container(
                        width: constraints.maxWidth * .8,
                        child: Text(
                          'Faites vos \nachats comme',
                          style: TextStyle(
                              color: colorsByDii.raisinBlack(),
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxHeight * .25),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: size.height * .07,
              child: Container(
                height: size.height * .1,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarkPhoneSOLU2(
                                id: widget.id,
                                genre: 'femme',
                              ),
                            )),
                        child: Container(
                          height: constraints.maxHeight * .7,
                          width: constraints.maxWidth * .4,
                          child: Center(
                            child: Text(
                              'Femme',
                              style: TextStyle(
                                  color: colorsByDii.white(),
                                  fontSize: constraints.maxHeight * .15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: colorsByDii.raisinBlack(),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * .2)),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: constraints.maxHeight * .7,
                        width: constraints.maxWidth * .4,
                        child: Center(
                          child: Text(
                            'Homme',
                            style: TextStyle(
                                color: colorsByDii.raisinBlack(),
                                fontSize: constraints.maxHeight * .15),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: colorsByDii.raisinBlack()),
                            borderRadius: BorderRadius.circular(
                                constraints.maxWidth * .2)),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
