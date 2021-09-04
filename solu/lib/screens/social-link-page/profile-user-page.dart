import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/top-nav-profile.dart';

class ProfileUserPage extends StatefulWidget {
  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
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
            // top: size.height * .1,
            child: Container(
          height: size.height * .6,
          width: size.width,
          decoration: BoxDecoration(
              color: Constant.JAUNE(),
              image: DecorationImage(
                  image: AssetImage('assets/images/home-tof.jpg'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
        )),
        Positioned(
            top: size.height * .4,
            left: size.width * .05,
            child: Container(
              height: size.height * .6,
              width: size.width * .9,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: size.height * .4,
                    child: Card(
                      color: Constant.BLUE(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            height: size.height * .15,
                            // color: Constant.ROUGE(),
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: size.width * .35,
                                  color: Constant.GRIS(),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width * .35,
                                  color: Constant.GRIS(),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: size.height * .15,
                            // color: Constant.ROUGE(),
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: size.width * .35,
                                  color: Constant.GRIS(),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width * .35,
                                  color: Constant.GRIS(),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * .05,
                    // color: Constant.JAUNE(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Container(
                            height: size.height * .03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Constant.JAUNE(), width: .5)),
                            child: Center(
                              child: Text(
                                '     View All      ',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            )),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    // color: Constant.BLUE(),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          width: size.width * .4,
                          // color: Constant.JAUNE(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/home-tof.jpg'),
                                  fit: BoxFit.fill),
                              color: Constant.BLUE()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: size.width * .4,
                          // color: Constant.JAUNE(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/home-tof.jpg'),
                                  fit: BoxFit.fill),
                              color: Constant.BLUE()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: size.width * .4,
                          // color: Constant.JAUNE(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/home-tof.jpg'),
                                  fit: BoxFit.fill),
                              color: Constant.BLUE()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: size.width * .4,
                          // color: Constant.JAUNE(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/home-tof.jpg'),
                                  fit: BoxFit.fill),
                              color: Constant.BLUE()),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .1,
                  )
                ],
              ),
            )),
        Positioned(
            top: 0,
            child: TopNavProfile(
              screen: 0,
              titrePage: 'Profile Page'.toUpperCase(),
            )),
      ],
    );
  }
}
