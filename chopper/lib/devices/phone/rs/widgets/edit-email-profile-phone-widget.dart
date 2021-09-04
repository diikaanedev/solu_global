import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditEmailProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditEmailProfileParamsWidgetPhoneState createState() =>
      _EditEmailProfileParamsWidgetPhoneState();
}

class _EditEmailProfileParamsWidgetPhoneState
    extends State<EditEmailProfileParamsWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  String email = '';
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
        email = value.get('email');
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
                  Text('email'),
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
                      // initialValue: name,
                      onChanged: (value) => setState(() {
                        email = value;
                      }),
                      readOnly: isRead,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: email),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     if (!isRead) {
                  //       FirebaseFirestore.instance
                  //           .collection(USERS_COLLECTION)
                  //           .doc(FirebaseAuth.instance.currentUser!.uid)
                  //           .update({
                  //         "email": email,
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
