import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditAboutProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditAboutProfileParamsWidgetPhoneState createState() =>
      _EditAboutProfileParamsWidgetPhoneState();
}

class _EditAboutProfileParamsWidgetPhoneState
    extends State<EditAboutProfileParamsWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  String about = '';
  bool isRead = true;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        about = value.get('about');
      });
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Container(
              height: constraints.maxHeight * .3,
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .1,
                  ),
                  Text('Votre description'),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * .6,
              width: constraints.maxWidth,
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .1,
                  ),
                  Container(
                    width: constraints.maxWidth * .7,
                    child: TextFormField(
                      // initialValue: About,
                      maxLines: 2,
                      readOnly: isRead,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: about),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!isRead) {
                        FirebaseFirestore.instance
                            .collection(USERS_COLLECTION)
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "about": about,
                        });
                      }
                      setState(() {
                        isRead = false;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: colorsByDii.eerieBlack(),
                      child: Center(
                        child: Icon(
                          isRead ? Icons.edit : Icons.send,
                          color: colorsByDii.white(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
