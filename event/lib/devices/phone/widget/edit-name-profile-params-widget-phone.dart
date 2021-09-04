import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditNameProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditNameProfileParamsWidgetPhoneState createState() =>
      _EditNameProfileParamsWidgetPhoneState();
}

class _EditNameProfileParamsWidgetPhoneState
    extends State<EditNameProfileParamsWidgetPhone> {
  String name = '';
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
        name = value.get('username');
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
                  Text('Votre username'),
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
                      readOnly: isRead,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: name),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!isRead) {
                        FirebaseFirestore.instance
                            .collection(USERS_COLLECTION)
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "username": name,
                        });
                      }
                      setState(() {
                        isRead = false;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorByDii.noir(),
                      child: Center(
                        child: Icon(
                          isRead ? Icons.edit : Icons.send,
                          color: ColorByDii.blanc(),
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
