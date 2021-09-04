import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditGenreProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditGenreProfileParamsWidgetPhoneState createState() =>
      _EditGenreProfileParamsWidgetPhoneState();
}

class _EditGenreProfileParamsWidgetPhoneState
    extends State<EditGenreProfileParamsWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  String genre = '';
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
        genre = value.get('genre');
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
                  Text('genre'),
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
                      width: constraints.maxWidth * .8,
                      child: DropdownButton(
                        underline: Container(),
                        value: genre,
                        hint: Container(
                            width: constraints.maxWidth * .7,
                            child: new Text('Choisir une sexe')),
                        items: <String>[
                          '',
                          'homme',
                          'femme',
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                                width: constraints.maxWidth * .7,
                                child: new Text(value == ''
                                    ? 'Choisir votre sexe'
                                    : value)),
                          );
                        }).toList(),
                        onChanged: (c) {
                          setState(() {
                            genre = c as String;
                          });
                          FirebaseFirestore.instance
                              .collection(USERS_COLLECTION)
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            "genre": genre,
                          });
                        },
                      )),
                  // GestureDetector(
                  //   onTap: () {
                  //     if (!isRead) {
                  //       FirebaseFirestore.instance
                  //           .collection(USERS_COLLECTION)
                  //           .doc(FirebaseAuth.instance.currentUser!.uid)
                  //           .update({
                  //         "genre": genre,
                  //       });
                  //     }
                  //     setState(() {
                  //       isRead = false;
                  //     });
                  //   },
                  //   child: CircleAvatar(
                  //     backgroundColor: colorsByDii.eerieBlack(),
                  //     child: Center(
                  //       child: Icon(
                  //         isRead ? Icons.edit : Icons.send,
                  //         color: colorsByDii.white(),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      );
}
