import 'dart:convert';

import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParticipantEventHomePhone extends StatefulWidget {
  final int invite;
  final String uid;
  final String idEvent, keyEvent;

  const ParticipantEventHomePhone(
      {Key? key,
      required this.invite,
      required this.uid,
      required this.keyEvent,
      required this.idEvent})
      : super(key: key);
  @override
  _ParticipantEventHomePhoneState createState() =>
      _ParticipantEventHomePhoneState();
}

class _ParticipantEventHomePhoneState extends State<ParticipantEventHomePhone> {
  List invite = [];
  bool isInvid = true;
  late Stream<DocumentSnapshot> invites;

  ColorsByDii colorsByDii = ColorsByDii();

  @override
  void initState() {
    super.initState();
    setState(() {
      invites = FirebaseFirestore.instance
          .collection(EVENEMENTS_COLLECTION)
          .doc(widget.idEvent)
          .snapshots();
    });
    // getPar();
  }

  getPar() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .doc(widget.idEvent)
        .get()
        .then((value) {
      value.data()!.forEach((key, element) {
        // print(element);
        if (key == 'invite') {
          setState(() {
            invite = element;
          });
        }
        print('invite.indexOf(uid) => ${invite.indexOf(uid)}');
        if (invite.indexOf(uid) != -1) {
          setState(() {
            isInvid = true;
          });
        } else {
          setState(() {
            isInvid = false;
          });
        }
      });
    });
  }

  participeClick() async {
    setState(() {
      invite.add(FirebaseAuth.instance.currentUser!.uid);
    });
    FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .doc(widget.idEvent)
        .update({'invite': invite}).then((value) => setState(() {
              isInvid = true;
            }));
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/dd/f6/0d/ddf60d1f007753160df98e83958d6abd.jpg'),
            )),
            Positioned(
                left: constraints.maxWidth * .05,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwtwc1gJ6qZUwZtT1N7GHgpAOrEKbnbFxGhK253uPVSC4uWdjKcsUuO-Mc_MCpMRBWjKk&usqp=CAU'),
                )),
            Positioned(
                left: constraints.maxWidth * .1,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://expertphotography.com/wp-content/uploads/2020/08/social-media-profile-photos-9.jpg'),
                )),
            // Positioned(
            //     left: constraints.maxWidth * .3,
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           'https://www.familyandmedia.eu/wp-content/uploads/2018/10/529382-4386816-selfie-psicologia-725x545.jpg'),
            //     )),
            Positioned(
                left: constraints.maxWidth * .15,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.adecco.ca/-/media/adeccogroup/brands/adecco-global-2016/canada/media/images/blog/why-linkedin-is-important-for-personal-branding.jpg'),
                )),
            Positioned(
                left: constraints.maxWidth * .2,
                child: CircleAvatar(
                  backgroundColor: colorsByDii.eerieBlack(),
                  child: Center(
                    child: StreamBuilder<Object>(
                        stream: invites,
                        builder: (context, snapshot) {
                          invites.forEach((element) {
                            setState(() {
                              invite = element.get('invite');
                            });
                            String uid = FirebaseAuth.instance.currentUser!.uid;

                            if (invite.indexOf(uid) != -1) {
                              setState(() {
                                isInvid = true;
                              });
                            } else {
                              setState(() {
                                isInvid = false;
                              });
                            }
                          });
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }

                          return Text(
                            '${invite.length}+',
                            style:
                                TextStyle(fontSize: constraints.maxWidth * .03),
                          );
                        }),
                  ),
                )),
            (widget.uid == FirebaseAuth.instance.currentUser!.uid)
                ? Container()
                : isInvid
                    ? Container()
                    : Positioned(
                        left: constraints.maxWidth * .65,
                        child: GestureDetector(
                          onTap: () => participeClick(),
                          child: Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth * .35,
                            child: Center(
                              child: Text(
                                'Participer',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * .07,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ),
                        ))
          ],
        ),
      );
}
