import 'package:chopper/devices/phone/rs/widgets/discussion-widget-phone-list.dart';
import 'package:chopper/devices/phone/rs/widgets/user-avatar-en-ligne-phone-widget.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserEnLignePhoneWidget extends StatefulWidget {
  @override
  _UserEnLignePhoneWidgetState createState() => _UserEnLignePhoneWidgetState();
}

class _UserEnLignePhoneWidgetState extends State<UserEnLignePhoneWidget> {
  ColorsByDii colorsByDii = ColorsByDii();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> dUser = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection(USERS_COLLECTION).get().then((value) {
      value.docs.forEach((element) {
        print(element.id);
        if (element.id != FirebaseAuth.instance.currentUser!.uid) {
          setState(() {
            dUser.add(element);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Spacer(),
            Container(
              // height: constraints.maxHeight * .25,
              width: constraints.maxWidth,
              // color: colorsByDii.honeyYellow(),
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                  Text(
                    "liste des Utilisateurs".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxHeight * .07),
                  ),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * .7,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: getList(constraints),
              ),
            ),
            Spacer(),
          ],
        ),
      );

  getList(constraints) {
    List<Widget> liste = [];

    for (var item in dUser) {
      liste.addAll([
        SizedBox(
          width: constraints.maxWidth * .02,
        ),
        Container(
          width: constraints.maxWidth * .2,
          child: UserAvatarEnLignePhoneWidget(
            avatar: item.get('urlAvatar'),
            name: item.get('username'),
          ),
        ),
      ]);
    }

    return liste;
  }
}
