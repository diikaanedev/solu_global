import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/devices/phone/solu/screen/mark-phone-solu.dart';
import 'package:chopper/devices/phone/solu/screen/shop-phone-solu.dart';
import 'package:chopper/devices/phone/solu/widgets/menu-botton-widget-solu.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/menu-btn-app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePhoneSolu extends StatefulWidget {
  const HomePhoneSolu({Key? key}) : super(key: key);

  @override
  _HomePhoneSoluState createState() => _HomePhoneSoluState();
}

class _HomePhoneSoluState extends State<HomePhoneSolu> {
  late Size size;
  ColorsByDii colorsByDii = ColorsByDii();
  String username = '';
  List marques = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        username = value.get('username');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        backgroundColor: colorsByDii.white(),
        elevation: .0,
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
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
                  child: MenuAppBtn(choix: 2),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                // Container(
                //   height: size.height * .07,
                //   width: size.width,
                //   // color: colorsByDii.honeyYellow(),
                //   child: LayoutBuilder(
                //     builder: (context, constraints) => Row(
                //       children: [
                //         SizedBox(
                //           width: constraints.maxWidth * .05,
                //         ),
                //         Container(
                //           width: constraints.maxWidth * .4,
                //           height: constraints.maxHeight,
                //           child: Column(
                //             children: [
                //               Spacer(),
                //               Container(
                //                 width: constraints.maxWidth * .4,
                //                 // height: constraints.maxHeight * .6,
                //                 child: Text(
                //                   'HELLO !',
                //                   style: TextStyle(
                //                       fontSize: constraints.maxHeight * .4,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               // Spacer(),
                //               Container(
                //                 width: constraints.maxWidth * .4,
                //                 child: Text(
                //                   '$username',
                //                   overflow: TextOverflow.ellipsis,
                //                   style: TextStyle(
                //                       fontSize: constraints.maxHeight * .2,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               Spacer(),
                //             ],
                //           ),
                //           // color: colorsByDii.eerieBlack(),
                //         ),
                //         Spacer(),
                //         Container(
                //           height: constraints.maxHeight,
                //           width: constraints.maxWidth * .4,
                //           child: Column(
                //             children: [
                //               Spacer(),
                //               Container(
                //                 height: constraints.maxHeight * .6,
                //                 width: constraints.maxWidth * .3,
                //                 child: Center(
                //                   child: Text(
                //                     'Tendance',
                //                     style: TextStyle(
                //                         fontSize: constraints.maxWidth * .03,
                //                         color: colorsByDii.white(),
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                 ),
                //                 decoration: BoxDecoration(
                //                     color: colorsByDii.raisinBlack(),
                //                     borderRadius: BorderRadius.circular(
                //                         constraints.maxWidth * .01)),
                //               ),
                //               Spacer(),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: size.height * .02,
                // ),
                Container(
                  height: size.height * .05,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Text(
                          'Best Marques',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .3,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Container(
                    height: size.height * .15,
                    width: size.width,
                    // color: colorsByDii.eerieBlack(),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(MARQUES_COLLECTION)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> list =
                              snapshot.data!.docs.map<Widget>((e) {
                            String i = e.get('color');
                            Color color = Color.fromRGBO(
                                int.parse(i.split(',')[0]),
                                int.parse(i.split(',')[1]),
                                int.parse(i.split(',')[2]),
                                1);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MarkPhoneSOLU(id: e.id),
                                    )),
                                child: Container(
                                  width: size.width * .35,
                                  height: size.height * .15,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Stack(
                                      children: [
                                        Container(
                                          height: constraints.maxHeight,
                                          width: constraints.maxWidth,
                                        ),
                                        Positioned(
                                            top: constraints.maxHeight * .3,
                                            child: Container(
                                                height:
                                                    constraints.maxHeight * .7,
                                                width: constraints.maxWidth,
                                                child: Center(
                                                  child: Text(
                                                    '     ${e.get('name')}     ',
                                                    style: TextStyle(
                                                        fontSize: constraints
                                                                .maxWidth *
                                                            .1,
                                                        color: colorsByDii
                                                            .white()),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: color,
                                                ))),
                                        Positioned(
                                            left: constraints.maxWidth * .2,
                                            child: Container(
                                                height:
                                                    constraints.maxHeight * .5,
                                                width:
                                                    constraints.maxWidth * .6,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          e.get('urlLogo')),
                                                      fit: BoxFit.fill),
                                                  color: colorsByDii.white(),
                                                ))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                          return ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: list);
                        }
                        return Container();
                      },
                    )),
                SizedBox(
                  height: size.height * .01,
                ),
                Container(
                  height: size.height * .05,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Text(
                          'Best Boutiques',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .3,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Container(
                  height: size.height * .6,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(BOUTIQUES_COLLECTION)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> list =
                              snapshot.data!.docs.map<Widget>((e) {
                            String i = e.get('color');
                            Color color = Color.fromRGBO(
                                int.parse(i.split(',')[0]),
                                int.parse(i.split(',')[1]),
                                int.parse(i.split(',')[2]),
                                1);
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ShopPhoneSOLU(id: e.id),
                                  )),
                              child: Container(
                                height: size.height * .6,
                                width: size.width,
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Stack(
                                    children: [
                                      Container(
                                        height: constraints.maxHeight,
                                        width: constraints.maxWidth,
                                      ),
                                      Positioned(
                                          top: 4,
                                          left: 4,
                                          child: Container(
                                            child: CircleAvatar(
                                              radius:
                                                  constraints.maxWidth * .07,
                                              backgroundColor:
                                                  colorsByDii.white(),
                                              backgroundImage: NetworkImage(
                                                  e.get('urlLogo')),
                                            ),
                                          )),
                                      Positioned(
                                          top: constraints.maxHeight * .1,
                                          child: Container(
                                            height: constraints.maxHeight * .8,
                                            width: constraints.maxWidth,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(e
                                                        .get('imagePremier')))),
                                          )),
                                      Positioned(
                                          right: constraints.maxWidth * .02,
                                          bottom: constraints.maxHeight * .12,
                                          child: CircleAvatar(
                                            backgroundColor: color,
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.right_chevron,
                                                size:
                                                    constraints.maxHeight * .05,
                                                color: colorsByDii.white(),
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                          return Carousel(
                            dotBgColor: Colors.transparent,
                            dotColor: colorsByDii.raisinBlack(),
                            dotIncreasedColor: colorsByDii.raisinBlack(),
                            autoplayDuration: Duration(seconds: 15),
                            images: list,
                          );
                        }
                        return Container();
                      }),
                )
              ],
            ),
          ))
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: size.height * .07,
      //   width: size.width,
      //   child: MenuBottomWidgetPhoneSOLU(screenChoix: 0),
      // ),
    );
  }
}
