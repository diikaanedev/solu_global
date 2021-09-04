import 'package:chopper/devices/phone/events/widgets/memorie-event-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/menu-botton-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/helper-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MemoriesFollowEventsScreenPhone extends StatefulWidget {
  @override
  _MemoriesFollowEventsScreenPhoneState createState() =>
      _MemoriesFollowEventsScreenPhoneState();
}

class _MemoriesFollowEventsScreenPhoneState
    extends State<MemoriesFollowEventsScreenPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  late FirebaseAuth auth;
  late List<Object> events = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      auth = FirebaseAuth.instance;
    });
    FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.data().forEach((key, value) {
          if (key != 'invite') {
            if (key != 'comments') {
              setState(() {
                events.add({
                  "idEvent": element.id,
                  "keyEvent": key,
                  "date": value['date'].toString().split(' ')[0].split('-'),
                  "description": value['description'],
                  "idUser": value['idUser'],
                  "image": value['image'],
                  "lieux": value['lieux'],
                  "time": value['time'],
                  "titre": value['titre'],
                  "isFree": value['isFree'] == '1',
                  "price":
                      value['isFree'] == '1' ? 0 : int.parse(value['price']),
                });
              });
            }
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        toolbarHeight: .0,
        backgroundColor: colorsByDii.white(),
      ),
      backgroundColor: colorsByDii.white(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: getList(),
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: colorsByDii.white(), boxShadow: [
            BoxShadow(color: colorsByDii.white(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 2,
          )),
    );
  }

  getList() {
    List<Widget> child = [];

    for (var item in events) {
      var d = item as Map;
      int y = int.parse(item['date'][0]);
      int m = int.parse(item['date'][1]);
      int dd = int.parse(item['date'][2]);

      child.add(MemorieEventWidgetPhone(
        idEvent: item['idEvent'],
        keyEvent: item['keyEvent'],
        date: dateFormatter(DateTime(y, m, dd)),
        description: item['description'],
        invite: 10,
        lieux: item['lieux'],
        isFree: item['isFree'],
        name: d['titre'].toString().toUpperCase(),
        urls: [d['image']],
        price: item['price'],
        uid: item['idUser'],
      ));
    }
    return child;
  }
}
