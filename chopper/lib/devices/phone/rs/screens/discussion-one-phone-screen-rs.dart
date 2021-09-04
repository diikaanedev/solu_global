import 'package:chopper/devices/phone/rs/widgets/discussion-list-msg-add-msg-widget-phone-rs.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscussionOnePhoneScreenRS extends StatefulWidget {
  final String id;
  const DiscussionOnePhoneScreenRS({Key? key, required this.id})
      : super(key: key);

  @override
  _DiscussionOnePhoneScreenRSState createState() =>
      _DiscussionOnePhoneScreenRSState();
}

class _DiscussionOnePhoneScreenRSState
    extends State<DiscussionOnePhoneScreenRS> {
  late Size size;
  String idUser = '';
  String username = '';
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  void initState() {
    super.initState();
    setState(() {
      idUser = widget.id.split('-')[0] == FirebaseAuth.instance.currentUser!.uid
          ? widget.id.split('-')[1]
          : widget.id.split('-')[0];
    });
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(idUser)
        .get()
        .then((value) {
      setState(() {
        username = value.get('username');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$username',
          style: TextStyle(color: colorsByDii.eerieBlack()),
        ),
        centerTitle: true,
        backgroundColor: colorsByDii.white(),
        elevation: 0,
        leading: Icon(
          CupertinoIcons.chevron_left,
          color: colorsByDii.eerieBlack(),
        ),
        actions: [
          Icon(
            CupertinoIcons.ellipsis_vertical,
            color: colorsByDii.eerieBlack(),
          ),
          SizedBox(
            width: size.width * .02,
          )
        ],
      ),
      backgroundColor: colorsByDii.white(),
      body: DiscussionListMsgAddMsgWidgetPhoneRS(
        idDiscussion: widget.id,
      ),
    );
  }
}
