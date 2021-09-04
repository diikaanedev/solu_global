import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscussionListMsgAddMsgWidgetPhoneRS extends StatefulWidget {
  final String idDiscussion;
  const DiscussionListMsgAddMsgWidgetPhoneRS(
      {Key? key, required this.idDiscussion})
      : super(key: key);

  @override
  _DiscussionListMsgAddMsgWidgetPhoneRSState createState() =>
      _DiscussionListMsgAddMsgWidgetPhoneRSState();
}

class _DiscussionListMsgAddMsgWidgetPhoneRSState
    extends State<DiscussionListMsgAddMsgWidgetPhoneRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  var _controller = TextEditingController();

  List messages = [];

  String msg_text = '';

  late Stream<DocumentSnapshot<Map<String, dynamic>>> msgStream;

  @override
  void initState() {
    super.initState();
    setState(() {
      msgStream = FirebaseFirestore.instance
          .collection(DISCUSSION_COLLECTION)
          .doc(widget.idDiscussion)
          .snapshots();
    });
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
                child: Container(
              height: constraints.maxHeight * .9,
              width: constraints.maxWidth,
              child: StreamBuilder<Object>(
                  stream: msgStream,
                  builder: (context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            // children: getList(constraints),
                            itemCount: snapshot.data["message"].length,
                            itemBuilder: (context, index) {
                              var item = snapshot.data["message"][index];
                              if (item['isReplay'] != true) {
                                return Container(
                                  width: constraints.maxWidth,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth * .02,
                                            ),
                                            Container(
                                              width: constraints.maxWidth * .6,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  item['msg'],
                                                  style: TextStyle(
                                                      color:
                                                          colorsByDii.white(),
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .02),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color:
                                                      colorsByDii.spanishGray(),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  // height: constraints.maxHeight * .1,
                                  width: constraints.maxWidth,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Container(
                                              width: constraints.maxWidth * .6,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  item['msg'],
                                                  style: TextStyle(
                                                      color:
                                                          colorsByDii.white(),
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .02),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  color:
                                                      colorsByDii.sizzlingRed(),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            SizedBox(
                                              width: constraints.maxWidth * .02,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
                        : Container();
                  }),
            )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: constraints.maxHeight * .1,
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(CupertinoIcons.doc),
                      Spacer(),
                      Icon(CupertinoIcons.smiley),
                      Spacer(),
                      Container(
                        width: constraints.maxWidth * .7,
                        height: constraints.maxHeight * .06,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            cursorColor: colorsByDii.eerieBlack(),
                            controller: _controller,
                            onChanged: (value) => setState(() {
                              msg_text = value;
                            }),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Ecrire votre méssage ...'),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(constraints.maxWidth * .05),
                          color: colorsByDii.white(),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection(DISCUSSION_COLLECTION)
                              .doc(widget.idDiscussion)
                              .get()
                              .then((value) {
                            setState(() {
                              messages = value.get('message') as List;
                              messages.add({
                                "date": DateTime.now(),
                                "isReplay":
                                    FirebaseAuth.instance.currentUser!.uid ==
                                        widget.idDiscussion.split('-')[0],
                                "msg": msg_text
                              });
                            });
                          });
                          _controller.clear();
                          FirebaseFirestore.instance
                              .collection(DISCUSSION_COLLECTION)
                              .doc(widget.idDiscussion)
                              .update({"message": messages});
                        },
                        icon: Icon(
                          Icons.send,
                          color: colorsByDii.sizzlingRed(),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  color: colorsByDii.grisCulture(),
                ))
          ],
        ),
      );

  List<Widget> getList(BoxConstraints constraints) {
    List<Widget> list = [];
    for (var item in messages) {
      if (item['isReplay'] == true) {
        list.addAll([
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          Container(
            width: constraints.maxWidth,
            child: Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * .02,
                ),
                Container(
                  width: constraints.maxWidth * .6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['msg'],
                      style: TextStyle(
                          color: colorsByDii.white(),
                          fontSize: constraints.maxHeight * .02),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: colorsByDii.spanishGray(),
                      borderRadius: BorderRadius.circular(8)),
                ),
                Spacer(),
              ],
            ),
          ),
        ]);
      } else {
        list.addAll([
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          Container(
            // height: constraints.maxHeight * .1,
            width: constraints.maxWidth,
            child: Row(
              children: [
                Spacer(),
                Container(
                  width: constraints.maxWidth * .6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['msg'],
                      style: TextStyle(
                          color: colorsByDii.white(),
                          fontSize: constraints.maxHeight * .02),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: colorsByDii.sizzlingRed(),
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(
                  width: constraints.maxWidth * .02,
                )
              ],
            ),
          ),
        ]);
      }
    }
    return list;
  }
}
