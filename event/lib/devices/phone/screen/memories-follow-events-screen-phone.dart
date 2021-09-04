import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/devices/phone/widget/memorie-event-widget-phone.dart';
import 'package:event/devices/phone/widget/menu-botton-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MemoriesFollowEventsScreenPhone extends StatefulWidget {
  @override
  _MemoriesFollowEventsScreenPhoneState createState() =>
      _MemoriesFollowEventsScreenPhoneState();
}

class _MemoriesFollowEventsScreenPhoneState
    extends State<MemoriesFollowEventsScreenPhone> {
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
        backgroundColor: ColorByDii.blanc(),
      ),
      backgroundColor: ColorByDii.blanc(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: getList(),
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: ColorByDii.blanc(), boxShadow: [
            BoxShadow(color: ColorByDii.blanc(), blurRadius: 20)
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
        date: ColorByDii.dateFormatter(DateTime(y, m, dd)),
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
