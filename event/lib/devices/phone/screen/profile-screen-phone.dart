import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/devices/phone/widget/menu-botton-widget-phone.dart';
import 'package:event/devices/phone/widget/menu-profile-widget-phone.dart';
import 'package:event/devices/phone/widget/name-description-profile-widget-phone.dart';
import 'package:event/devices/phone/widget/top-bar-profile-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreenPhone extends StatefulWidget {
  @override
  _ProfileScreenPhoneState createState() => _ProfileScreenPhoneState();
}

class _ProfileScreenPhoneState extends State<ProfileScreenPhone> {
  late Size size;
  String urlAvatar = '';
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        urlAvatar = value.get('urlAvatar');
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
        backgroundColor: ColorByDii.blanc(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: ColorByDii.blanc(),
          ),
          Positioned(
              child: Container(
            height: size.height * .07,
            width: size.width,
            child: TopBarProfileWidgetPhone(),
          )),
          Positioned(
              top: size.height * .07,
              child: Container(
                height: size.height * .2,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      Spacer(),
                      CircleAvatar(
                        radius: constraints.maxHeight,
                        foregroundImage: NetworkImage(urlAvatar == ''
                            ? 'https://i.pinimg.com/originals/57/6d/aa/576daa664f58efb1d59b7b81883ec314.jpg'
                            : urlAvatar),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                // color: ColorByDii.noir(),
              )),
          Positioned(
              top: size.height * .3,
              child: Container(
                height: size.height * .2,
                width: size.width,
                child: NameDescriptionProfileWidgetPhone(),
              )),
          Positioned(
              top: size.height * .55,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
                child: Container(
                  height: size.height * .45,
                  width: size.width,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * .05,
                        width: size.width * .45,
                        child: Center(
                          child: Text(
                            'Général',
                            style: TextStyle(
                                fontSize: size.width * .03,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // color: ColorByDii.noir(),
                      ),
                      Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: MenuProfileWidgetPhone(
                          icon: Icons.add,
                          onpress: () =>
                              Navigator.pushNamed(context, '/event/add'),
                          titreMenu: 'Ajouter événement',
                        ),
                      ),
                      Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: MenuProfileWidgetPhone(
                          icon: Icons.topic,
                          onpress: () =>
                              Navigator.pushNamed(context, '/profile-tickets'),
                          titreMenu: 'Mes billets',
                        ),
                      ),
                      Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: MenuProfileWidgetPhone(
                          icon: Icons.settings,
                          onpress: () =>
                              Navigator.pushNamed(context, '/profile-params'),
                          titreMenu: 'Profile paramètres',
                        ),
                      ),
                      Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: MenuProfileWidgetPhone(
                          icon: Icons.book_rounded,
                          onpress: () => null,
                          titreMenu: 'Mes bonnus',
                        ),
                      ),
                      Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: MenuProfileWidgetPhone(
                          icon: Icons.money,
                          onpress: () => null,
                          titreMenu: 'Payements',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: ColorByDii.blanc(), boxShadow: [
            BoxShadow(color: ColorByDii.blanc(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 3,
          )),
    );
  }
}
