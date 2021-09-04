import 'dart:io';

import 'package:chopper/devices/phone/rs/widgets/edit-email-profile-phone-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/edit-genre-profile-phone-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/edit-name-profile-phone-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/edit-tel-profile-phone-widget.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePhoneScreen extends StatefulWidget {
  const EditProfilePhoneScreen({Key? key}) : super(key: key);

  @override
  _EditProfilePhoneScreenState createState() => _EditProfilePhoneScreenState();
}

class _EditProfilePhoneScreenState extends State<EditProfilePhoneScreen> {
  late Size size;
  ColorsByDii colorsByDii = ColorsByDii();
  String username = '';
  String telephone = '';
  String email = '';
  String genre = '';

  String avatar = '';

  bool isRead = true;
  late File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child('avatar/${FirebaseAuth.instance.currentUser!.uid}')
          .putFile(image)
          .whenComplete(() => print('heefe'));

      snapshot.ref.getDownloadURL().then((value) => setState(() {
            avatar = value as String;
            FirebaseFirestore.instance
                .collection(USERS_COLLECTION)
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              "urlAvatar": avatar,
            });
          }));
    } else {
      print('No image selected.');
    }
  }

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
        email = value.get('email');
        genre = value.get('genre');
        avatar = value.get('urlAvatar');
        telephone = value.get('telephone');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorsByDii.white(),
        // toolbarHeight: size.height * .05,
        elevation: .0,
        iconTheme: IconThemeData(color: colorsByDii.eerieBlack(), size: 28),
        leading: Icon(CupertinoIcons.chevron_left),
        centerTitle: true,
        title: Text(
          'Éditer informations',
          style: TextStyle(color: colorsByDii.eerieBlack(), fontSize: 14),
        ),
        actions: [
          GestureDetector(
            onTap: () async => FirebaseFirestore.instance
                .collection(USERS_COLLECTION)
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              "urlAvatar": avatar,
              "email": email,
              "genre": genre,
              "telephone": telephone,
              // ignore: equal_keys_in_map
              "urlAvatar": avatar,
              "username": username
            }),
            child: Container(
              // height: size.height * .05,
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: colorsByDii.sizzlingRed(),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * .05,
            // color: colorsByDii.sizzlingRed(),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height * .35,
            width: size.width,
            child: Center(
              child: Container(
                height: size.height * .25,
                width: size.width * .5,
                decoration: BoxDecoration(
                    // color: colorsByDii.eerieBlack(),
                    image: DecorationImage(
                        image: NetworkImage(avatar == ''
                            ? 'https://resize3.prod.docfr.doc-media.fr/rcrop/1200,678,center-middle/img/var/doctissimo/storage/images/fr/www/grossesse/infertilite/sterilite-masculine/homme-horloge-biologique/75333-2-fre-FR/homme-horloge-biologique.jpg'
                            : avatar),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(size.width * .05)),
              ),
            ),
          )),
          Positioned(
              child: Container(
            height: size.height * .35,
            width: size.width,
            child: Center(
              child: GestureDetector(
                onTap: () => getImage(),
                child: Container(
                  height: size.height * .25,
                  width: size.width * .5,
                  child: Center(
                      child: Icon(
                    CupertinoIcons.photo_camera_solid,
                    size: size.height * .1,
                    color: colorsByDii.white(),
                  )),
                  decoration: BoxDecoration(
                      color: colorsByDii.sizzlingRed().withOpacity(.15),
                      borderRadius: BorderRadius.circular(size.width * .05)),
                ),
              ),
            ),
          )),
          Positioned(
              top: size.height * .32,
              child: Card(
                elevation: 5,
                shadowColor: colorsByDii.white(),
                child: Container(
                    height: size.height * .57,
                    width: size.width,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Column(
                        children: [
                          Spacer(),
                          Container(
                            height: constraints.maxHeight * .15,
                            // color: colorsByDii.sizzlingRed(),
                            child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: LayoutBuilder(
                                  builder: (context, constraints) => Column(
                                    children: [
                                      Container(
                                        height: constraints.maxHeight * .3,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth * .1,
                                            ),
                                            Text('username'),
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
                                                onChanged: (value) =>
                                                    setState(() {
                                                  username = value;
                                                }),
                                                // readOnly: true,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: username),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Spacer(),
                          Container(
                            height: constraints.maxHeight * .15,
                            // color: colorsByDii.sizzlingRed(),
                            child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: LayoutBuilder(
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
                                                onChanged: (value) =>
                                                    setState(() {
                                                  email = value;
                                                }),
                                                readOnly: isRead,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: email),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Spacer(),
                          Container(
                            height: constraints.maxHeight * .15,
                            // color: colorsByDii.sizzlingRed(),
                            child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: LayoutBuilder(
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
                                                onChanged: (value) =>
                                                    setState(() {
                                                  telephone = value;
                                                }),
                                                readOnly: isRead,
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: telephone),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Spacer(),
                          Container(
                            height: constraints.maxHeight * .15,
                            // color: colorsByDii.sizzlingRed(),
                            child: Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: LayoutBuilder(
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
                                                width:
                                                    constraints.maxWidth * .8,
                                                child: DropdownButton(
                                                  underline: Container(),
                                                  value: genre,
                                                  hint: Container(
                                                      width:
                                                          constraints.maxWidth *
                                                              .7,
                                                      child: new Text(
                                                          'Choisir une sexe')),
                                                  items: <String>[
                                                    '',
                                                    'homme',
                                                    'femme',
                                                  ].map((String value) {
                                                    return new DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Container(
                                                          width: constraints
                                                                  .maxWidth *
                                                              .7,
                                                          child: new Text(value ==
                                                                  ''
                                                              ? 'Choisir votre sexe'
                                                              : value)),
                                                    );
                                                  }).toList(),
                                                  onChanged: (c) {
                                                    setState(() {
                                                      genre = c as String;
                                                    });
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            USERS_COLLECTION)
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .update({
                                                      "genre": genre,
                                                    });
                                                  },
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Spacer(),
                        ],
                      ),
                    )),
              ))
        ],
      ),
      backgroundColor: colorsByDii.white(),
    );
  }
}
