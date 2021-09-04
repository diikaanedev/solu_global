// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:chopper/devices/phone/events/widgets/card-events-home-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/categorie-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/menu-botton-widget-phone.dart';
import 'package:chopper/devices/phone/events/widgets/titre-widget-phone.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/helper-by-dii.dart';
import 'package:chopper/utils/menu-btn-app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreenPhoneEVENT extends StatefulWidget {
  @override
  _HomeScreenPhoneEVENTState createState() => _HomeScreenPhoneEVENTState();
}

class _HomeScreenPhoneEVENTState extends State<HomeScreenPhoneEVENT> {
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
    // getAnonyme();
    FirebaseFirestore.instance
        .collection(EVENEMENTS_COLLECTION)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.data().forEach((key, value) {
          print(key);
          print(value);
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

  getAnonyme() async {
    await auth.signInAnonymously().then((value) async {
      FirebaseFirestore.instance
          .collection(USERS_COLLECTION)
          .doc(value.user!.uid)
          .set({
        "about": "geek2.0 nane katou atayaa dof de 1er rang",
        "email": "noEmail@email.com",
        "telephone": "7700000000",
        "urlAvatar":
            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
        "username": "no Name",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: 0.0,
        backgroundColor: colorsByDii.eerieBlack(),
      ),
      body: Stack(
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
                SizedBox(
                  height: size.height * .01,
                ),
                Container(
                  height: size.height * .05,
                  width: size.width,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 20, color: colorsByDii.white())
                  ]),
                  child: MenuAppBtn(choix: 1),
                ),
                Container(
                  height: size.height * .05,
                  width: size.width,
                  child: TitreWidgetPhone(titre: 'Categories'),
                ),
                Container(
                  height: size.height * .13,
                  width: size.width,
                  // color: colorsByDii.eerieBlack(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            width: size.width * .2,
                            child: CategorieWidgetPhone(
                              text: 'Concerts',
                              url:
                                  'https://sound2kill4.com/wp-content/uploads/2016/11/events.jpg',
                            ),
                            decoration: BoxDecoration(
                              color: colorsByDii.white(),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            width: size.width * .2,
                            child: CategorieWidgetPhone(
                              text: 'Conférence',
                              url:
                                  'https://mylifeproject.org/wp-content/uploads/2020/07/new_statesman_events.jpg',
                            ),
                            decoration: BoxDecoration(
                              color: colorsByDii.white(),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            width: size.width * .2,
                            child: CategorieWidgetPhone(
                              text: 'Sport',
                              url:
                                  'https://www.wallpaperup.com/uploads/wallpapers/2014/02/05/248162/31f7b85c5ea38359c4fedaa1c75bf7d0-700.jpg',
                            ),
                            decoration: BoxDecoration(
                              color: colorsByDii.white(),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            width: size.width * .2,
                            child: CategorieWidgetPhone(
                              text: 'Exposition',
                              url:
                                  'https://cdn-s-www.leprogres.fr/images/8BCDC72C-BB9F-486F-BFC5-33A99CCA6F7D/MF_contenu/genesis-a-la-sucriere-l-expo-essentielle-de-sebastiao-salgado-1582209088.jpg',
                            ),
                            decoration: BoxDecoration(
                              color: colorsByDii.white(),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .05,
                  width: size.width,
                  child: TitreWidgetPhone(titre: 'Vos meilleurs évenements'),
                ),
                Container(
                  // height: size.height * .8,
                  width: size.width,
                  // color: colorsByDii.gris(),
                  child: Column(children: getList()),
                ),
              ],
            ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: colorsByDii.white(), boxShadow: [
            BoxShadow(color: colorsByDii.white(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 0,
          )),
    );
  }

  getList() {
    List<Widget> liste = [];
    for (var item in events) {
      var d = item as Map;
      int y = int.parse(item['date'][0]);
      int m = int.parse(item['date'][1]);
      int dd = int.parse(item['date'][2]);

      liste.add(SizedBox(
        height: size.height * .03,
      ));
      liste.add(Container(
        height: size.height * .5,
        width: size.width,
        child: CardEventsHomeWidgetPhone(
          idEvent: item['idEvent'],
          keyEvent: item['keyEvent'],
          date: dateFormatter(DateTime(y, m, dd)),
          description: item['description'],
          invite: 867,
          isFree: item['isFree'],
          name: d['titre'].toString().toUpperCase(),
          url: d['image'],
          price: item['price'],
          uid: item['idUser'],
        ),
        // color: colorsByDii.eerieBlack(),
      ));
    }
    liste.add(SizedBox(
      height: size.height * .03,
    ));
    if (liste.length == 1) {
      liste.add(Container(
        height: size.height * .6,
        width: size.width,
        child: Center(
            child: CircularProgressIndicator(
          backgroundColor: colorsByDii.white(),
          valueColor: AlwaysStoppedAnimation<Color>(colorsByDii.eerieBlack()),
        )),
      ));
    }
    return liste;
  }
}
