import 'dart:math';

import 'package:chopper/devices/phone/rs/widgets/menu-btn-hoome-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/post-home-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/storie-home-add-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/storie-home-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/title-home-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/top-home-nav-search-add-widget.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/helper-by-dii.dart';
import 'package:chopper/utils/menu-btn-app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart';

class HomePhoneScreenRS extends StatefulWidget {
  @override
  _HomePhoneScreenRSState createState() => _HomePhoneScreenRSState();
}

class _HomePhoneScreenRSState extends State<HomePhoneScreenRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;

  List<QueryDocumentSnapshot> stories = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(STORIES_COLLECTION)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          stories.add(element);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    StatusBar.color(colorsByDii.white());

    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: colorsByDii.white(),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: colorsByDii.white(),
            ),
            Positioned(
                child: Container(
              height: size.height,
              width: size.width,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: size.height * .07,
                    width: size.width,
                    child: MenuAppBtn(choix: 0),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    height: size.height * .07,
                    child: TopHomeNavSearchAddWidget(),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Container(
                    height: size.height * .05,
                    child: TitleHomeWidget(titre: 'Stories'),
                  ),
                  Container(
                    height: size.height * .25,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(STORIES_COLLECTION)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> list = snapshot.data!.docs
                                .map<Widget>(
                                  (item) => Container(
                                    width: size.width * .4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StorieHomeWidget(
                                        urlAvatar: item.get('avatarUrl'),
                                        url: item.get('img').cast<String>(),
                                        isLive: false,
                                        name: item.get('name'),
                                      ),
                                    ),
                                  ),
                                )
                                .toList();
                            list.insert(
                              0,
                              Container(
                                width: size.width * .4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StorieAddHomeWidget(),
                                ),
                              ),
                            );
                            return ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: list,
                            );
                          }
                          return Container(
                              width: size.width * .4,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(POSTS_COLLECTION)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.docs.map((e) {
                              return Container(
                                height: size.height * .8,
                                child: PostHomeWidgetRS(
                                  urlAvatar: e.get('userAvatar'),
                                  likes: e.get('likes'),
                                  comments: e.get('comments'),
                                  idUser: e.get('userId'),
                                  body: e.get('bodyPosts'),
                                  name: e.get('userName'),
                                  url: e.get('imagePosts')?.cast<String>(),
                                ),
                              );
                            }).toList(),
                          );
                        } else
                          return Container(
                              height: size.height * .8,
                              child:
                                  Center(child: CircularProgressIndicator()));
                      })
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * .07,
        child: MenuBottomWidgetPhone(screenChoix: 0),
      ),
    );
  }

  getList() {
    List<Widget> list = [
      SizedBox(
        width: size.width * .02,
      ),
      Container(
        width: size.width * .35,
        child: StorieAddHomeWidget(),
      ),
    ];

    for (var item in stories) {
      list.addAll([
        SizedBox(
          width: size.width * .02,
        ),
        Container(
          width: size.width * .35,
          child: StorieHomeWidget(
            urlAvatar: item.get('avatarUrl'),
            url: item.get('image'),
            isLive: true,
            name: item.get('name'),
          ),
        ),
      ]);
    }
    return list;
  }
}
