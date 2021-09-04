// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/devices/phone/widget/discussion-one-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MemorieEventWidgetPhone extends StatefulWidget {
  final String name, description;
  final List<String> urls;
  final List<String> date;
  final int price, invite;
  final bool isFree;
  final String uid;
  final String idEvent, keyEvent;
  final String lieux;

  const MemorieEventWidgetPhone(
      {Key? key,
      required this.urls,
      required this.name,
      required this.description,
      required this.date,
      required this.price,
      required this.invite,
      required this.isFree,
      required this.uid,
      required this.idEvent,
      required this.keyEvent,
      required this.lieux})
      : super(key: key);

  @override
  _MemorieEventWidgetPhoneState createState() =>
      _MemorieEventWidgetPhoneState();
}

class _MemorieEventWidgetPhoneState extends State<MemorieEventWidgetPhone> {
  List discussion = [];
  String commentaire = '';
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .doc(widget.idEvent)
        .get()
        .then((value) {
      value.data()!.forEach((key, element) {
        if (key == 'comments') {
          setState(() {
            discussion = element;
          });
        }
      });
    });
  }

  commentClick() async {
    discussion.add({
      "commentaire": commentaire,
      "userID": FirebaseAuth.instance.currentUser!.uid,
      "username": "diikaanedev"
    });
    // invite.add(widget.uid);
    print(discussion);
    await FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .doc(widget.idEvent)
        .update({'comments': discussion}).then((value) => print('good'));
    setState(() {
      commentaire = '';
    });
  }

  getListDiscussion(constraints) {
    List<Widget> liste = [];

    for (var item in discussion) {
      var d = item as Map;

      liste.add(
        Container(
            height: constraints.maxHeight * .1,
            child: DiscussionOneWidgetPhone(
              date: '5',
              message: d['commentaire'],
              username: d['username'],
            )),
      );
      liste.add(SizedBox(
        height: constraints.maxWidth * .02,
      ));
    }

    return Container(
      child: Column(
        children: liste,
      ),
    );
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
              height: constraints.maxHeight * .5,
              width: constraints.maxWidth,
              child: Carousel(
                dotColor: ColorByDii.gris(),
                dotBgColor: Colors.transparent,
                dotIncreasedColor: ColorByDii.blanc(),
                autoplayDuration: Duration(seconds: 10),
                dotPosition: DotPosition.topRight,
                images: widget.urls
                    .map((e) => Image.network(
                          e,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ),
            )),
            Positioned(
                left: constraints.maxWidth * .05,
                top: constraints.maxHeight * .425,
                child: Card(
                  child: Container(
                      height: constraints.maxHeight * .12,
                      width: constraints.maxWidth * .9,
                      child: Center(
                        child: Container(
                          height: constraints.maxHeight * .1,
                          width: constraints.maxWidth * .9,
                          child: LayoutBuilder(
                            builder: (context, c) => Row(
                              children: [
                                SizedBox(
                                  width: c.maxWidth * .01,
                                ),
                                Container(
                                  width: c.maxWidth * .25,
                                  child: Card(
                                    elevation: .5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            c.maxHeight * .01)),
                                    child: Container(
                                      height: c.maxHeight,
                                      width: c.maxWidth,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: c.maxHeight * .2,
                                            width: c.maxWidth,
                                            child: Center(
                                                child: Text(
                                              '${widget.date[3]}',
                                              style: TextStyle(
                                                  color: ColorByDii.blanc(),
                                                  fontSize: c.maxHeight * .15),
                                            )),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      c.maxHeight * .01),
                                                  topRight: Radius.circular(
                                                      c.maxHeight * .01),
                                                )),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${widget.date[1]}',
                                            style: TextStyle(
                                                color: ColorByDii.noir(),
                                                fontSize: c.maxHeight * .2),
                                          ),
                                          SizedBox(
                                            height: c.maxHeight * .01,
                                          ),
                                          Text(
                                            '${widget.date[0]}',
                                            style: TextStyle(
                                                color: ColorByDii.noir(),
                                                fontSize: c.maxHeight * .2),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: ColorByDii.blanc(),
                                          borderRadius: BorderRadius.circular(
                                              c.maxHeight * .01)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .05,
                                ),
                                Container(
                                  width: constraints.maxWidth * .5,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * .01,
                                      ),
                                      Container(
                                        width: constraints.maxWidth * .6,
                                        child: Text(
                                          '${widget.name}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  constraints.maxHeight * .025),
                                        ),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .01,
                                      ),
                                      Container(
                                        width: constraints.maxWidth * .6,
                                        child: Text(
                                          '${widget.lieux}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize:
                                                  constraints.maxHeight * .02),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                )),
            Positioned(
                top: constraints.maxHeight * .57,
                child: Container(
                  height: constraints.maxHeight * .43,
                  width: constraints.maxWidth,
                  // color: Colors.red,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        child: Column(
                          children: [
                            Container(
                              height: constraints.maxHeight * .05,
                              width: constraints.maxWidth,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                // height: constraints.maxHeight * .15,
                                width: constraints.maxWidth,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('${widget.description}'),
                                )),
                            Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .05,
                              child: Row(
                                children: [
                                  SizedBox(width: constraints.maxWidth * .05),
                                  Text(
                                    'Participant',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .07,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://img.chefdentreprise.com/Img/FICHEPRATIQUE/2020/10/354260/Event-manager-toutes-ses-fonctions-F.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * .15,
                                    decoration: BoxDecoration(
                                        color: ColorByDii.gris(),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: Text(
                                        '+${widget.invite}',
                                        style: TextStyle(
                                            color: ColorByDii.blanc()),
                                      ),
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * .02,
                            ),
                            Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .05,
                              child: Row(
                                children: [
                                  SizedBox(width: constraints.maxWidth * .05),
                                  Text(
                                    'Discussion',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            getListDiscussion(constraints)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .02,
                      ),
                      Container(
                        height: constraints.maxHeight * .07,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            onChanged: (value) => setState(() {
                              commentaire = value;
                            }),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () => commentClick(),
                                  child: Icon(
                                    Icons.send,
                                    color: ColorByDii.gris(),
                                  ),
                                ),
                                hintText: 'ajouter une discussion ?',
                                hintStyle: TextStyle(color: ColorByDii.gris())),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      );
}
