import 'package:chopper/devices/phone/rs/screens/discussion-one-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/discussion-widget-phone-list.dart';
import 'package:chopper/devices/phone/rs/widgets/menu-btn-hoome-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/user-avatar-en-ligne-phone-widget.dart';
import 'package:chopper/devices/phone/rs/widgets/user-en-ligne-phone-widget.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/helper-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscussionPhoneScreenRS extends StatefulWidget {
  @override
  _DiscussionPhoneScreenRSState createState() =>
      _DiscussionPhoneScreenRSState();
}

class _DiscussionPhoneScreenRSState extends State<DiscussionPhoneScreenRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> d = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> dUser = [];
  late Stream<QuerySnapshot<Map<String, dynamic>>> snapshotsDiscussion;
  int taille = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      snapshotsDiscussion = FirebaseFirestore.instance
          .collection(DISCUSSION_COLLECTION)
          .snapshots();
    });
    FirebaseFirestore.instance
        .collection(DISCUSSION_COLLECTION)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          d.add(element);
        });
      });
    });

    FirebaseFirestore.instance.collection(USERS_COLLECTION).get().then((value) {
      value.docs.forEach((element) {
        print(element.id);
        if (element.id != FirebaseAuth.instance.currentUser!.uid) {
          setState(() {
            dUser.add(element);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: .0,
        backgroundColor: colorsByDii.white(),
        centerTitle: true,
        title: Text(
          'Disccusion',
          style: TextStyle(color: colorsByDii.eerieBlack()),
        ),
        iconTheme: IconThemeData(color: colorsByDii.eerieBlack()),
        leading: Icon(CupertinoIcons.back),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add_circled),
            onPressed: () async => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Row(
                    children: [
                      Icon(Icons.close),
                      Spacer(),
                      Text(
                        'Nouveau méssage',
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        'Suivant',
                        style: TextStyle(
                            fontSize: 10, color: colorsByDii.sizzlingRed()),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  elevation: 0,
                  content: Container(
                    height: size.height * .6,
                    width: size.width,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: dUser
                          .map((e) => Container(
                              height: size.height * .07,
                              width: size.width * .07,
                              child: ListTile(
                                onTap: () async {
                                  FirebaseFirestore.instance
                                      .collection(DISCUSSION_COLLECTION)
                                      .doc(
                                          "${FirebaseAuth.instance.currentUser!.uid}-${e.id}")
                                      .get()
                                      .then((value) {
                                    if (value.exists) {
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection(DISCUSSION_COLLECTION)
                                          .doc(
                                              "${FirebaseAuth.instance.currentUser!.uid}-${e.id}")
                                          .set({
                                        "avatar": e.get('urlAvatar'),
                                        "username": e.get('username'),
                                        "message": []
                                      });
                                    }
                                  });
                                },
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(e.get('urlAvatar')),
                                ),
                                title: Text(
                                  e.get('username'),
                                  style: TextStyle(
                                      fontSize: size.height * .02,
                                      fontWeight: FontWeight.bold),
                                ),
                              )))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: size.width * .05,
          )
        ],

        elevation: .3,
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: colorsByDii.white(),
          ),
          // Positioned(
          //     child: Container(
          //   height: size.height * .2,
          //   width: size.width,
          //   decoration: BoxDecoration(
          //       border: Border(
          //           bottom: BorderSide(color: colorsByDii.grisCulture()))),
          //   child: UserEnLignePhoneWidget(),
          // )),
          Positioned(
              // top: size.height * .2,
              child: Container(
            height: size.height,
            width: size.width,
            child: StreamBuilder<Object>(
                stream: snapshotsDiscussion,
                builder: (context, AsyncSnapshot snapshot) {
                  snapshotsDiscussion.forEach((element) {});

                  return snapshot.hasData
                      ? ListView(
                          physics: BouncingScrollPhysics(),
                          children: getList(),
                        )
                      : Container();
                }),
          ))
        ],
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * .07,
        child: MenuBottomWidgetPhone(screenChoix: 2),
      ),
    );
  }

  getList() {
    List<Widget> liste = [];

    for (var item in d) {
      if (item.id.split('-')[0] == FirebaseAuth.instance.currentUser!.uid ||
          item.id.split('-')[1] == FirebaseAuth.instance.currentUser!.uid) {
        var d = item.get('message') as List;
        var date;
        if (d.length != 0) {
          Timestamp time = d.last['date'];
          date = new DateTime.fromMicrosecondsSinceEpoch(
              time.millisecondsSinceEpoch * 1000);
        }
        liste.add(
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiscussionOnePhoneScreenRS(id: item.id),
                )),
            child: Container(
              height: size.height * .15,
              width: size.width,
              child: DiscussionWidgetPhoneList(
                idDiscussion: item.id,
                date: d.length == 0
                    ? ''
                    : readTimestamp(date.difference(DateTime.now())),
                msg: d.length == 0 ? '' : d.last['msg'],
              ),
            ),
          ),
        );
      }
    }

    if (liste.length == 0) {
      liste.add(Container(
        height: size.height * .6,
        width: size.width,
        child: Center(
          child: Text('Pas de discussion pour le moment'),
        ),
      ));
    }

    return liste;
  }
}
