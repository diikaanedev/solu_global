import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PostHomeWidgetRS extends StatefulWidget {
  final String name, urlAvatar, body, idUser;
  final List<String> url;
  final List likes, comments;

  const PostHomeWidgetRS(
      {Key? key,
      required this.name,
      required this.urlAvatar,
      required this.url,
      required this.body,
      required this.idUser,
      required this.likes,
      required this.comments})
      : super(key: key);
  @override
  _PostHomeWidgetRSState createState() => _PostHomeWidgetRSState();
}

class _PostHomeWidgetRSState extends State<PostHomeWidgetRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  List follower = [];
  List followerF = [];
  List following = [];
  List followingF = [];
  String username = '';
  String usernameF = '';
  String telephone = '';
  String telephoneF = '';
  String email = '';
  String emailF = '';
  String genre = '';
  String genreF = '';

  String avatar = '';
  String avatarF = '';

  bool isFollow = false;
  @override
  void initState() {
    super.initState();
    getVerif();
  }

  getVerif() async {
    await FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        follower = value.get('follower');
        following = value.get('following');
        username = value.get('username');
        email = value.get('email');
        genre = value.get('genre');
        avatar = value.get('urlAvatar');
        telephone = value.get('telephone');
      });
    });
    await FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(widget.idUser)
        .get()
        .then((value) {
      setState(() {
        followerF = value.get('follower');
        followingF = value.get('following');
        usernameF = value.get('username');
        emailF = value.get('email');
        genreF = value.get('genre');
        avatarF = value.get('urlAvatar');
        telephoneF = value.get('telephone');
      });
    });
    verifIfFollow();
  }

  verifIfFollow() {
    follower.forEach((element) {
      var d = element as Map;
      if (d['idFollower'] == widget.idUser) {
        setState(() {
          isFollow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Card(
          child: Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
              ),
              Positioned(
                  child: Container(
                height: constraints.maxHeight * .2,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    ),
                    CircleAvatar(
                      radius: constraints.maxWidth * .07,
                      backgroundColor: colorsByDii.tanMarron(),
                      backgroundImage: NetworkImage('${widget.urlAvatar}'),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    ),
                    Container(
                      width: constraints.maxWidth * .3,
                      // height: constraints.maxHeight * .1,
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            width: constraints.maxWidth * .3,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: colorsByDii.raisinBlack(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxWidth * .035),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * .3,
                            child: Text(
                              'Depuis 5min',
                              style: TextStyle(
                                  color: colorsByDii.lightGray(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxWidth * .025),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    if (FirebaseAuth.instance.currentUser!.uid != widget.idUser)
                      isFollow
                          ? GestureDetector(
                              onTap: () async {
                                setState(() {
                                  follower.removeWhere((element) =>
                                      element['idFollower'] == widget.idUser);
                                });
                                FirebaseFirestore.instance
                                    .collection(USERS_COLLECTION)
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({
                                  "follower": follower,
                                });
                                setState(() {
                                  isFollow = false;
                                });
                              },
                              child: Container(
                                width: constraints.maxWidth * .3,
                                height: constraints.maxHeight * .05,
                                child: Center(
                                  child: Text(
                                    'Ne plus Suivre',
                                    style: TextStyle(
                                        color: colorsByDii.sizzlingRed(),
                                        fontWeight: FontWeight.w400,
                                        fontSize: constraints.maxWidth * .035),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    // color: colorsByDii.raisinBlack(),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: colorsByDii.sizzlingRed(),
                                        width: 1)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                setState(() {
                                  follower.add({
                                    "idFollower": widget.idUser,
                                    "nameFollower": usernameF,
                                    "avatar": avatarF
                                  });
                                  followingF.add({
                                    "idFollowing":
                                        FirebaseAuth.instance.currentUser!.uid,
                                    "nameFollowing": username,
                                    "avatar": avatar
                                  });
                                });
                                FirebaseFirestore.instance
                                    .collection(USERS_COLLECTION)
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({
                                  "follower": follower,
                                });
                                FirebaseFirestore.instance
                                    .collection(USERS_COLLECTION)
                                    .doc(widget.idUser)
                                    .update({
                                  "following": followingF,
                                });
                                setState(() {
                                  isFollow = true;
                                });
                              },
                              child: Container(
                                width: constraints.maxWidth * .3,
                                height: constraints.maxHeight * .05,
                                child: Center(
                                  child: Text(
                                    'Suivre',
                                    style: TextStyle(
                                        color: colorsByDii.sizzlingRed(),
                                        fontWeight: FontWeight.w400,
                                        fontSize: constraints.maxWidth * .035),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    // color: colorsByDii.raisinBlack(),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: colorsByDii.sizzlingRed(),
                                        width: 1)),
                              ),
                            ),
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                  ],
                ),
              )),
              Positioned(
                  top: constraints.maxHeight * .2,
                  child: Container(
                    height: constraints.maxHeight * .8,
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .65,
                          width: constraints.maxWidth,
                          child: Carousel(
                            dotBgColor: Colors.transparent,
                            // autoplayDuration: false,
                            autoplay: false,
                            images: widget.url
                                .map((e) => Image.network(e, fit: BoxFit.cover))
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Container(
                          width: constraints.maxWidth,
                          child: Text(widget.body),
                        ),
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .1,
                          width: constraints.maxWidth,
                          // color: colorsByDii.honeyYellow(),
                          child: Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .02,
                              ),
                              Icon(Icons.favorite_border_rounded),
                              SizedBox(
                                width: constraints.maxWidth * .01,
                              ),
                              Text(widget.likes.length.toString()),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              ),
                              Icon(CupertinoIcons.square_favorites),
                              SizedBox(
                                width: constraints.maxWidth * .01,
                              ),
                              Text(widget.comments.length.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
}
