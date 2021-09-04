import 'dart:io';

import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: camel_case_types
class addCollectionPhoneScreenRS extends StatefulWidget {
  const addCollectionPhoneScreenRS({Key? key}) : super(key: key);

  @override
  _addCollectionPhoneScreenRSState createState() =>
      _addCollectionPhoneScreenRSState();
}

// ignore: camel_case_types
class _addCollectionPhoneScreenRSState
    extends State<addCollectionPhoneScreenRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  String urlImage = '';

  String name = '';
  String avatar = '';
  late File image;
  final picker = ImagePicker();

  bool chargement = false;

  late VideoPlayerController _controller;

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
        avatar = value.get('urlAvatar');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
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
          'Créer une collection',
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
                height: size.height * .8,
                width: size.width * .9,
                child: urlImage != ''
                    ? _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                  });
                                },
                                child: VideoPlayer(_controller)),
                          )
                        : Container()
                    : Container(),
                decoration: urlImage == ''
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorsByDii.white(),
                        image: DecorationImage(
                            image: NetworkImage(urlImage == ''
                                ? 'https://www.montpellierwaterpolo.com/wp-content/uploads/2018/06/fond.png'
                                : urlImage),
                            fit: BoxFit.cover))
                    : BoxDecoration(),
              )),
          chargement
              ? Positioned(
                  left: size.width * .05,
                  top: size.height * .02,
                  child: Container(
                    height: size.height * .8,
                    width: size.width * .9,
                    child: Center(child: CircularProgressIndicator()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorsByDii.raisinBlack().withOpacity(.5),
                    ),
                  ))
              : Positioned(
                  left: size.width * .05,
                  top: size.height * .02,
                  child: GestureDetector(
                    onTap: () => getImage(),
                    child: Container(
                      height: size.height * .8,
                      width: size.width * .9,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.video_camera_solid,
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
              top: size.height * .83,
              left: size.width * .2,
              child: GestureDetector(
                onTap: () => sendPosts(),
                child: Container(
                  height: size.height * .05,
                  width: size.width * .6,
                  child: Center(
                    child: Text(
                      'Plubier',
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
    await FirebaseFirestore.instance.collection(COLLECTIONS_COLLECTION).add({
      "video": urlImage,
      "userId": id,
      "userName": name,
      "userAvatar": avatar,
      "comments": [],
      "likes": [],
      "vues": []
    }).then((value) => setState(() {
          chargement = false;
        }));
    Navigator.pop(context);
  }

  Future getImage() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        chargement = true;
      });

      var snapshot = await FirebaseStorage.instance
          .ref()
          .child('collections/${DateTime.now().toString()}')
          .putFile(image)
          .whenComplete(() => print('heefe'));

      snapshot.ref.getDownloadURL().then((value) => setState(() {
            urlImage = value as String;
            chargement = false;
            _controller = VideoPlayerController.network(urlImage)
              ..initialize().then((_) {
                // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                setState(() {
                  _controller.play();
                });
              });
          }));
    } else {
      print('No vieo selected.');
    }
  }
}
