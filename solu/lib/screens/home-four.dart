import 'package:flutter/material.dart';
import 'package:solu/screens/social-link-page/cart-page.dart';
import 'package:solu/screens/social-link-page/detail-destination-page.dart';
import 'package:solu/screens/social-link-page/discover-page.dart';
import 'package:solu/screens/social-link-page/home-page.dart';
import 'package:solu/screens/social-link-page/profile-page.dart';
import 'package:solu/screens/social-link-page/profile-user-page.dart';

_HomeFourState homeFourState;

class HomeFour extends StatefulWidget {
  @override
  _HomeFourState createState() {
    homeFourState = _HomeFourState();
    return homeFourState;
  }
}

class _HomeFourState extends State<HomeFour> {
  Size size;
  bool showHome = true;
  bool showFavorie = false;
  bool showBag = false;
  bool showProfile = false;
  int screen = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: screen == 0
          ? HomePage()
          : screen == 1
              ? DiscoverPage()
              : screen == 2
                  ? CartPage()
                  : screen == 3
                      ? ProfileUserPage()
                      : screen == 4
                          ? ProfilePage()
                          : screen == 5
                              ? DetailsDestinationsPage()
                              : Container(),
    );
  }
}
