import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditTelProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditTelProfileParamsWidgetPhoneState createState() =>
      _EditTelProfileParamsWidgetPhoneState();
}

class _EditTelProfileParamsWidgetPhoneState
    extends State<EditTelProfileParamsWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  String tel = '';
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
        tel = value.get('telephone');
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
                  Text('téléphone'),
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
                      onChanged: (value) => setState(() {
                        tel = value;
                      }),
                      readOnly: isRead,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: tel),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     if (!isRead) {
                  //       FirebaseFirestore.instance
                  //           .collection(USERS_COLLECTION)
                  //           .doc(FirebaseAuth.instance.currentUser!.uid)
                  //           .update({
                  //         "telephone": tel,
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
