import 'package:chopper/devices/phone/rs/widgets/comment-explore-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/explore-phone-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/menu-btn-hoome-widget-rs.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:chopper/utils/menu-btn-app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart';

class ExplorePhoneScreenRS extends StatefulWidget {
  @override
  _ExplorePhoneScreenRSState createState() => _ExplorePhoneScreenRSState();
}

class _ExplorePhoneScreenRSState extends State<ExplorePhoneScreenRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(COLLECTIONS_COLLECTION)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasData
                ? PageView(
                    physics: BouncingScrollPhysics(),
                    children: snapshot.data!.docs
                        .map<Widget>(
                          (item) => Container(
                            width: size.width * .4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExplorePhoneWidgetRS(
                                comments: item.get('comments'),
                                id: item.id,
                                vues: item.get('vues'),
                                likes: item.get('likes'),
                                url: item.get('video'),
                                name: item.get('userName'),
                                avatar: item.get('userAvatar'),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Container();
          }),
      bottomNavigationBar: Container(
        width: size.width,
        height: size.height * .07,
        child: MenuBottomWidgetPhone(screenChoix: 1),
      ),
    );
  }
}
