import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/feed-widget-card.dart';
import 'package:solu/widgets/top-nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Constant.BLANC(),
            )),
        Positioned(
            top: 0,
            child: TopNav(
              type: 2,
            )),
        Positioned(
            top: size.height * .1,
            child: Container(
              height: size.height,
              width: size.width,
              color: Constant.BLANC(),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: size.height * .7,
                    width: size.width,
                    child: FeedWidgetCard(
                      url: 'assets/images/home-tof.jpg',
                    ),
                  ),
                  Container(
                    height: size.height * .7,
                    width: size.width,
                    child: FeedWidgetCard(
                      url: 'assets/images/home-tof2.jpg',
                    ),
                  ),
                  Container(
                    height: size.height * .7,
                    width: size.width,
                    child: FeedWidgetCard(
                      url: 'assets/images/home-tof.jpg',
                    ),
                  ),
                  Container(
                    height: size.height * .7,
                    width: size.width,
                    child: FeedWidgetCard(
                      url: 'assets/images/home-tof2.jpg',
                    ),
                  ),
                  SizedBox(
                    height: size.height * .25,
                  )
                  // Container(
                  //   height: size.height * .5,
                  //   width: size.width,
                  //   child: FeedWidgetCard(),
                  // ),
                  // Container(
                  //   height: size.height * .5,
                  //   width: size.width,
                  //   child: FeedWidgetCard(),
                  // ),
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: size.height * .2,
              width: size.width,
              // color: Constant.VERT(),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .08,
                  ),
                  Container(
                    height: size.height * .07,
                    width: size.width * .9,
                    // color: Constant.BLUE(),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          height: size.height * .07,
                          width: size.width * .9,
                          child: Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeFourState.setState(() {
                                    homeFourState.showBag = false;
                                    homeFourState.showProfile = false;
                                    homeFourState.showFavorie = false;
                                    homeFourState.showHome = true;
                                    homeFourState.screen = 0;
                                  });
                                },
                                child: Container(
                                  height: size.height * .05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeFourState.showHome
                                          ? Constant.ORANGE()
                                          : Colors.transparent),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.home_filled,
                                        color: homeFourState.showHome
                                            ? Constant.BLUE()
                                            : Constant.BLANC(),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      if (homeFourState.showHome)
                                        Text(
                                          'Home',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Constant.BLUE(),
                                              fontWeight: FontWeight.w900),
                                        ),
                                      if (homeFourState.showHome)
                                        SizedBox(
                                          width: 5,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeFourState.setState(() {
                                    homeFourState.showHome = false;
                                    homeFourState.showBag = false;
                                    homeFourState.showProfile = false;
                                    homeFourState.showFavorie = true;
                                    homeFourState.screen = 1;
                                  });
                                },
                                child: Container(
                                  height: size.height * .05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeFourState.showFavorie
                                          ? Constant.ORANGE()
                                          : Colors.transparent),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.explore_outlined,
                                        color: homeFourState.showFavorie
                                            ? Constant.BLUE()
                                            : Constant.BLANC(),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      if (homeFourState.showFavorie)
                                        Text(
                                          ' Discover ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Constant.BLUE(),
                                              fontWeight: FontWeight.w900),
                                        ),
                                      if (homeFourState.showFavorie)
                                        SizedBox(
                                          width: 5,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeFourState.setState(() {
                                    homeFourState.showHome = false;
                                    homeFourState.showProfile = false;
                                    homeFourState.showFavorie = false;
                                    homeFourState.showBag = true;
                                    homeFourState.screen = 2;
                                  });
                                },
                                child: Container(
                                  height: size.height * .05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeFourState.showBag
                                          ? Constant.ORANGE()
                                          : Colors.transparent),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.shopping_bag_rounded,
                                        color: homeFourState.showBag
                                            ? Constant.BLUE()
                                            : Constant.BLANC(),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      if (homeFourState.showBag)
                                        Text(
                                          ' Cart ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Constant.BLUE(),
                                              fontWeight: FontWeight.w900),
                                        ),
                                      if (homeFourState.showBag)
                                        SizedBox(
                                          width: 5,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  homeFourState.setState(() {
                                    homeFourState.showHome = false;
                                    homeFourState.showFavorie = false;
                                    homeFourState.showBag = false;
                                    homeFourState.showProfile = true;
                                    homeFourState.screen = 3;
                                  });
                                },
                                child: Container(
                                  height: size.height * .05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeFourState.showProfile
                                          ? Constant.ORANGE()
                                          : Colors.transparent),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.person_outline_outlined,
                                        color: homeFourState.showProfile
                                            ? Constant.BLUE()
                                            : Constant.BLANC(),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      if (homeFourState.showProfile)
                                        Text(
                                          ' Profile ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Constant.BLUE(),
                                              fontWeight: FontWeight.w900),
                                        ),
                                      if (homeFourState.showProfile)
                                        SizedBox(
                                          width: 5,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constant.BLUE()),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
