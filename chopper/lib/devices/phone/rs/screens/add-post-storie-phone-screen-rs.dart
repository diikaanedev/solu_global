import 'dart:io';

import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostStoriePhoneScreenRS extends StatefulWidget {
  const AddPostStoriePhoneScreenRS({Key? key}) : super(key: key);

  @override
  _AddPostStoriePhoneScreenRSState createState() =>
      _AddPostStoriePhoneScreenRSState();
}

class _AddPostStoriePhoneScreenRSState
    extends State<AddPostStoriePhoneScreenRS> {
  late Size size;
  String urlImage = '';
  String name = '';
  String telephone = '';
  String email = '';
  String genre = '';

  String avatar = '';
  ColorsByDii colorsByDii = ColorsByDii();

  List<String> imagePosts = [];

  late File image;
  final picker = ImagePicker();

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
        leading: Icon(
          CupertinoIcons.chevron_back,
          color: colorsByDii.eerieBlack(),
        ),
        backgroundColor: colorsByDii.white(),
        centerTitle: true,
        title: Text(
          'Créer une publication',
          style: TextStyle(color: colorsByDii.eerieBlack(), fontSize: 12),
        ),
        elevation: .0,
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              left: size.width * .05,
              top: size.height * .02,
              child: Container(
                height: size.height * .35,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorsByDii.white(),
                    image: DecorationImage(
                        image: NetworkImage(urlImage == ''
                            ? 'https://www.montpellierwaterpolo.com/wp-content/uploads/2018/06/fond.png'
                            : urlImage),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              left: size.width * .05,
              top: size.height * .02,
              child: GestureDetector(
                onTap: () => getImage(),
                child: Container(
                  height: size.height * .35,
                  width: size.width * .9,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.photo_camera_solid,
                      size: size.height * .05,
                      color: colorsByDii.white(),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorsByDii.raisinBlack().withOpacity(.5),
                  ),
                ),
              )),
          Positioned(
              top: size.height * .4,
              left: size.width * .05,
              child: Container(
                height: size.height * .6,
                width: size.width * .9,
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        height: size.height * .1,
                        width: size.width * .9,
                        child: TextField(
                          maxLines: 5,
                          decoration:
                              InputDecoration(labelText: 'Lou bess ? , $name'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Card(
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .9,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Container(
                                width: size.width * .2,
                                child: Text(
                                  'Doli si ',
                                  style: TextStyle(
                                      // fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: colorsByDii.raisinBlack()),
                                )),
                            Container(
                              width: size.width * .65,
                              // color: colorsByDii.sizzlingRed(),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        GestureDetector(
                                          child: Icon(
                                            CupertinoIcons.person_add_solid,
                                            size: 30,
                                          ),
                                        ),
                                        // Spacer(),
                                        Text('xarit'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        GestureDetector(
                                          child: Icon(
                                            CupertinoIcons.smiley,
                                            size: 30,
                                          ),
                                        ),
                                        // Spacer(),
                                        Text('humeur'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        GestureDetector(
                                          child: Icon(
                                            CupertinoIcons.map_pin_ellipse,
                                            size: 30,
                                          ),
                                        ),
                                        // Spacer(),
                                        Text('fane le'),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: size.height * .65,
              left: size.width * .2,
              child: GestureDetector(
                onTap: () => sendPosts(),
                child: Container(
                  height: size.height * .05,
                  width: size.width * .6,
                  child: Center(
                    child: Text(
                      'Yéné',
                      style: TextStyle(color: colorsByDii.white()),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorsByDii.eerieBlack(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Future sendPosts() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    if (imagePosts.length > 0) {
      FirebaseFirestore.instance.collection(POSTS_COLLECTION).add({
        "imagePosts": imagePosts,
        "bodyPosts": "niak xam lou bess fall motax ma tok fi ?",
        "userId": id,
        "userName": name,
        "userAvatar": avatar,
        "comments": [],
        "likes": [],
        "vues": []
      }).then((value) => null);
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      var snapshot = await FirebaseStorage.instance
          .ref()
          .child('posts/${DateTime.now().toString()}')
          .putFile(image)
          .whenComplete(() => print('heefe'));

      snapshot.ref.getDownloadURL().then((value) => setState(() {
            urlImage = value as String;
            imagePosts.add(urlImage);
          }));
    } else {
      print('No image selected.');
    }
  }
}
