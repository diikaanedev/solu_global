import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditTelephoneProfileParamsWidgetPhone extends StatefulWidget {
  @override
  _EditTelephoneProfileParamsWidgetPhoneState createState() =>
      _EditTelephoneProfileParamsWidgetPhoneState();
}

class _EditTelephoneProfileParamsWidgetPhoneState
    extends State<EditTelephoneProfileParamsWidgetPhone> {
  String telephone = '';
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
        telephone = value.get('telephone');
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
                  Text('Votre téléphone'),
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
                      // initialValue: Telephone,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => setState(() {
                        telephone = value;
                      }),
                      readOnly: isRead,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: telephone),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!isRead) {
                        FirebaseFirestore.instance
                            .collection(USERS_COLLECTION)
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "telephone": telephone,
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
