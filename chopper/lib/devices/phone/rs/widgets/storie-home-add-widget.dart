import 'dart:io';

import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorieAddHomeWidget extends StatefulWidget {
  @override
  _StorieAddHomeWidgetState createState() => _StorieAddHomeWidgetState();
}

class _StorieAddHomeWidgetState extends State<StorieAddHomeWidget> {
  ColorsByDii colorsByDii = ColorsByDii();

  String username = '';
  String avatarUser = '';

  late File image;
  final picker = ImagePicker();
  String img = '';

  List<String> imageStories = [];

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
        avatarUser = value.get('urlAvatar');
      });
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child('stories/${DateTime.now()}')
          .putFile(image)
          .whenComplete(() => print('heefe'));

      snapshot.ref.getDownloadURL().then((value) => setState(() {
            img = value as String;
            FirebaseFirestore.instance
              ..collection(STORIES_COLLECTION)
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .get()
                  .then((value) {
                if (value.exists) {
                  List t = value.get('img');
                  t.add(img);
                  FirebaseFirestore.instance
                      .collection(STORIES_COLLECTION)
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    "img": t,
                  });
                } else {
                  FirebaseFirestore.instance
                      .collection(STORIES_COLLECTION)
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    "idUser": FirebaseAuth.instance.currentUser!.uid,
                    "avatarUrl": avatarUser,
                    "name": username,
                    "img": [img],
                    "dateTime": DateTime.now()
                  });
                }
              });
          }));
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => getImage(),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
              ),
              Positioned(
                  child: Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/photos-gratuite/lune-ciel-noir_181624-15297.jpg?size=626&ext=jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8)),
              )),
              Positioned(
                  bottom: constraints.maxHeight * .05,
                  child: Container(
                    height: constraints.maxHeight * .2,
                    width: constraints.maxWidth,
                    // color: colorsByDii.raisinBlack(),
                    child: Row(
                      children: [
                        Spacer(),
                        CircleAvatar(
                          radius: constraints.maxWidth * .2,
                          backgroundColor: colorsByDii.white(),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.add,
                              color: colorsByDii.sizzlingRed(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Text(
                          'Ajouter Storie',
                          style: TextStyle(
                              color: colorsByDii.white(),
                              fontSize: constraints.maxWidth * .07),
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
}
