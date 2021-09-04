import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/card-destination.dart';
import 'package:solu/widgets/top-nav-profile.dart';
import 'package:solu/widgets/top-nav.dart';
import 'package:solu/widgets/widget-discover-categorie.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
            child: TopNavProfile(
              screen: 0,
              titrePage: 'Discover PAGE'.toUpperCase(),
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
                    height: size.height * .05,
                    width: size.width,
                    // color: Constant.ROUGE(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Container(
                          height: size.height * .03,
                          child: Center(
                            child: Text(
                              '    See All    '.toUpperCase(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // color: Constant.ORANGE(),
                              border: Border.all(color: Constant.ORANGE())),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * .15,
                    width: size.width,
                    // color: Constant.ROUGE(),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          height: size.height * .1,
                          width: size.width * .25,
                          // color: Constant.ROUGE(),
                          child: WidgetDiscoverCategorie(
                            icon: Icons.hotel_rounded,
                            text: 'Hotels',
                            color: Constant.JAUNE(),
                          ),
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width * .25,
                          // color: Constant.ROUGE(),
                          child: WidgetDiscoverCategorie(
                            icon: Icons.flight,
                            text: 'Vols',
                            color: Constant.VERT(),
                          ),
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width * .25,
                          // color: Constant.ROUGE(),
                          child: WidgetDiscoverCategorie(
                            icon: Icons.food_bank_rounded,
                            text: 'Foods',
                            color: Constant.ROUGE(),
                          ),
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width * .25,
                          // color: Constant.ROUGE(),
                          child: WidgetDiscoverCategorie(
                            icon: Icons.event,
                            text: 'Events',
                            color: Constant.MARON_DUR(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .07,
                    width: size.width,
                    // color: Constant.ROUGE(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Best Destination',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Container(
                          height: size.height * .03,
                          child: Center(
                            child: Text(
                              '    See All    '.toUpperCase(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // color: Constant.ORANGE(),
                              border: Border.all(color: Constant.ORANGE())),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .707,
                    width: size.width,
                    // color: Constant.ROUGE(),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: size.width * .4,
                          child: Column(
                            children: [
                              Container(
                                height: size.height * .2,
                                child: CardDestinationWidget(
                                  urlTof: 'assets/images/hotel1.jpg',
                                  name: 'Lieux 1',
                                  note: '4.8',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: size.height * .3,
                                child: CardDestinationWidget(
                                  urlTof: 'assets/images/hotel2.jpg',
                                  note: '5.0',
                                  name: 'Lieux 2',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: size.height * .15,
                                child: CardDestinationWidget(
                                  urlTof: 'assets/images/hotel3.jpg',
                                  name: 'Lieux 3',
                                  note: '4.2',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: size.width * .4,
                          child: Column(
                            children: [
                              Container(
                                height: size.height * .3,
                                child: CardDestinationWidget(
                                  urlTof: 'assets/images/hotel3.jpg',
                                  name: 'Lieux 4',
                                  note: '4.4',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: size.height * .35,
                                child: CardDestinationWidget(
                                  name: 'Lieux 5',
                                  urlTof: 'assets/images/hotel4.jpg',
                                  note: '4.5',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .4,
                    color: Constant.ROUGE(),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
