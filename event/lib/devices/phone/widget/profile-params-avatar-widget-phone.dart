import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileParamsAvatarWidgetPhone extends StatefulWidget {
  @override
  _ProfileParamsAvatarWidgetPhoneState createState() =>
      _ProfileParamsAvatarWidgetPhoneState();
}

class _ProfileParamsAvatarWidgetPhoneState
    extends State<ProfileParamsAvatarWidgetPhone> {
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

  late File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Row(
                children: [
                  Spacer(),
                  CircleAvatar(
                    maxRadius: constraints.maxWidth * .3,
                    backgroundColor: ColorByDii.noir(),
                    backgroundImage: NetworkImage(
                      urlAvatar == ''
                          ? 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'
                          : urlAvatar,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
                left: constraints.maxWidth * .6,
                top: constraints.maxHeight * .7,
                child: GestureDetector(
                  onTap: getImage,
                  child: CircleAvatar(
                    backgroundColor: ColorByDii.noir(),
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      color: ColorByDii.blanc(),
                    ),
                  ),
                ))
          ],
        ),
      );
}
