import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart' show StatusBar;

class GetStarting extends StatefulWidget {
  @override
  _GetStartingState createState() => _GetStartingState();
}

class _GetStartingState extends State<GetStarting> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    StatusBar.color(colorsByDii.white());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: colorsByDii.white(),
          ),
          Positioned(
              bottom: size.height * .05,
              left: size.width * .15,
              child: GestureDetector(
                onTap: () => FirebaseAuth.instance
                    .signInAnonymously()
                    .then((value) async {
                  FirebaseFirestore.instance
                      .collection(USERS_COLLECTION)
                      .doc(value.user!.uid)
                      .set({
                    "genre": "",
                    "email": "",
                    "telephone": "",
                    "urlAvatar":
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYdpMWCuAhC5098pZ4ba4cmCp9h9Nmi73KyFUQ4VsekZnJ4USfPLNl25EvNyFM_qOayjM&usqp=CAU",
                    "username": "no Name",
                  });
                }),
                child: Container(
                  height: size.height * .07,
                  width: size.width * .7,
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: colorsByDii.white()),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorsByDii.eerieBlack()),
                ),
              ))
        ],
      ),
    );
  }
}
