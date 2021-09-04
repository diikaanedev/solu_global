import 'package:chopper/devices/phone/rs/widgets/menu-btn-hoome-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/profile-menu-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePhoneScreenRS extends StatefulWidget {
  @override
  _ProfilePhoneScreenRSState createState() => _ProfilePhoneScreenRSState();
}

class _ProfilePhoneScreenRSState extends State<ProfilePhoneScreenRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  String name = '';
  String avatar = '';
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        name = value.get('username');
        avatar = value.get('urlAvatar');
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
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height * .3,
            width: size.width,
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Spacer(),
                  Container(
                    height: constraints.maxHeight * .5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .03,
                        ),
                        Container(
                          width: constraints.maxWidth * .3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // color: colorsByDii.sizzlingRed(),
                              image: DecorationImage(
                                image: NetworkImage(avatar == ''
                                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYdpMWCuAhC5098pZ4ba4cmCp9h9Nmi73KyFUQ4VsekZnJ4USfPLNl25EvNyFM_qOayjM&usqp=CAU'
                                    : avatar),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Container(
                          width: constraints.maxWidth * .6,
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                // height: constraints.maxHeight * .2,
                                width: constraints.maxWidth * .6,
                                // color: colorsByDii.sizzlingRed(),
                                child: Row(
                                  children: [
                                    Text(
                                      '$name',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .07,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Spacer(),
                              Container(
                                // height: constraints.maxHeight * .1,
                                width: constraints.maxWidth * .6,
                                child: Row(
                                  children: [
                                    Text(
                                      '@$name',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, '/rs-edit-profile'),
                                child: Container(
                                  height: constraints.maxHeight * .1,
                                  width: constraints.maxWidth * .3,
                                  decoration: BoxDecoration(
                                      color: colorsByDii.sizzlingRed(),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        '  Éditer profile  ',
                                        style: TextStyle(
                                            fontSize:
                                                constraints.maxWidth * .03,
                                            color: colorsByDii.white(),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: constraints.maxHeight * .4,
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: constraints.maxWidth * .3,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '128',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .04,
                                    fontWeight: FontWeight.w100),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: constraints.maxWidth * .3,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '3012',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Follower',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .04,
                                    fontWeight: FontWeight.w100),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: constraints.maxWidth * .3,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '5034',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .05,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .04,
                                    fontWeight: FontWeight.w100),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            decoration: BoxDecoration(color: colorsByDii.white(), boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  offset: Offset(2, 2),
                  color: colorsByDii.grisCulture())
            ]),
          )),
          Positioned(
              top: size.height * .31,
              child: Container(
                height: size.height * .69,
                width: size.width,
                // color: colorsByDii.raisinBlack(),
                child: Column(
                  children: [
                    // Spacer(),
                    Container(
                      height: size.height * .2,
                      // color: colorsByDii.raisinBlack(),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          height: size.height * .17,
                          width: size.width * .95,
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                height: size.height * .06,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons
                                      .arrowtriangle_right_circle_fill,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Mes diffusions ',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .06,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.chat_bubble_fill,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Messages',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .06,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.group_solid,
                                  onpress: () => null,
                                  color: colorsByDii.raisinBlack(),
                                  titreMenu: 'Rechercher des amies',
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .37,
                      child: Card(
                        elevation: 1,
                        // color: colorsByDii.raisinBlack(),
                        child: Container(
                          height: size.height * .35,
                          width: size.width * .95,
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.news_solid,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'L\'actualités chez vous',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.photo_camera_solid,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Photographies',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.music_mic,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Nos animateurs',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.mail_solid,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Nous contacter',
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.width * .9,
                                child: MenuProfileWidgetPhone(
                                  icon: CupertinoIcons.gear_solid,
                                  color: colorsByDii.eerieBlack(),
                                  onpress: () => null,
                                  titreMenu: 'Paramètres',
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * .07,
        child: MenuBottomWidgetPhone(screenChoix: 3),
      ),
    );
  }
}
