import 'dart:ui';

import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NameDescriptionProfileWidgetPhone extends StatefulWidget {
  @override
  _NameDescriptionProfileWidgetPhoneState createState() =>
      _NameDescriptionProfileWidgetPhoneState();
}

class _NameDescriptionProfileWidgetPhoneState
    extends State<NameDescriptionProfileWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  String username = '';
  String about = '';
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
        about = value.get('about');
      });
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Container(
              child: Text(
                username,
                style: TextStyle(
                    fontSize: constraints.maxHeight * .1,
                    fontWeight: FontWeight.bold,
                    color: colorsByDii.eerieBlack()),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              width: constraints.maxWidth * .8,
              child: Center(
                child: Text(
                  "$about $about $about",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: constraints.maxHeight * .08,
                      color: colorsByDii.eerieBlack(),
                      fontWeight: FontWeight.w100),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(
              height: constraints.maxHeight * .3,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: constraints.maxWidth * .3,
                    height: constraints.maxHeight * .2,
                    child: Center(
                      child: Text(
                        '  post ',
                        style: TextStyle(
                            fontSize: constraints.maxHeight * .1,
                            color: colorsByDii.white()),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: colorsByDii.eerieBlack(),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * .1,
                  ),
                  Container(
                    width: constraints.maxHeight * .2,
                    height: constraints.maxHeight * .2,
                    child: Icon(
                      Icons.settings,
                      color: colorsByDii.white(),
                    ),
                    decoration: BoxDecoration(
                        color: colorsByDii.grisCulture(),
                        borderRadius:
                            BorderRadius.circular(constraints.maxWidth)),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      );
}
