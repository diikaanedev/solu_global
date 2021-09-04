import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiscussionWidgetPhoneList extends StatefulWidget {
  final String msg, date, idDiscussion;

  const DiscussionWidgetPhoneList(
      {Key? key,
      required this.idDiscussion,
      required this.msg,
      required this.date})
      : super(key: key);
  @override
  _DiscussionWidgetPhoneListState createState() =>
      _DiscussionWidgetPhoneListState();
}

class _DiscussionWidgetPhoneListState extends State<DiscussionWidgetPhoneList> {
  ColorsByDii colorsByDii = ColorsByDii();
  late String id;
  String avatar = '';
  String username = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      id = widget.idDiscussion.split('-')[0] ==
              FirebaseAuth.instance.currentUser!.uid
          ? widget.idDiscussion.split('-')[1]
          : widget.idDiscussion.split('-')[0];
    });
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(id)
        .get()
        .then((value) {
      print(value.data());
      setState(() {
        avatar = value.get('urlAvatar');
        username = value.get('username');
      });
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            Container(
              width: constraints.maxWidth * .3,
              // color: colorsByDii.honeyYellow(),
              child: Center(
                  child: CircleAvatar(
                radius: constraints.maxWidth * .1,
                backgroundImage: NetworkImage(avatar),
              )),
            ),
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth * .67,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: colorsByDii.grisCulture()))),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          widget.date,
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .03,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Container(
                    // height: constraints.maxHeight * .4,
                    width: constraints.maxWidth * .67,
                    child: Text(
                      widget.msg,
                      style: TextStyle(
                          fontSize: constraints.maxWidth * .03,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      );
}
