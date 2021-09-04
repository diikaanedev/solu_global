import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';
import 'package:solu/widgets/top-nav-profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              image: DecorationImage(
                  image: AssetImage('assets/images/home-tof.jpg'),
                  fit: BoxFit.fill)),
        ),
        Positioned(
            top: 0,
            child: TopNavProfile(
              screen: 0,
              titrePage: 'Profile Page'.toUpperCase(),
            )),
        Positioned(
          top: size.height * .4,
          left: size.width * .1,
          child: Container(
            height: size.height * .6,
            width: size.width * .92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              topLeft: Radius.circular(8),
            )),
            child: Card(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size.height * .13,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Container(
                          width: size.width * .6,
                          // color: Constant.ROUGE(),
                          child: Column(
                            children: [
                              // Spacer(),
                              Container(
                                width: size.width * .6,
                                child: Text(
                                  'Mariama',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 38, color: Constant.BLANC()),
                                ),
                              ),
                              // Spacer(),
                              Container(
                                width: size.width * .6,
                                child: Text(
                                  'Laye Kane',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 38, color: Constant.BLANC()),
                                ),
                              ),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * .25,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      // color: Constant.ROUGE(),
                                      child: Center(
                                        child: Icon(
                                          Icons.close_fullscreen_outlined,
                                          color: Constant.BLANC(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // Spacer(),
                  Container(
                    height: .5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Container(
                          width: size.width * .8,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: size.height * .07,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: size.width * .25,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '130',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constant.BLANC()),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(color: Constant.BLANC()),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * .25,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '250k',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constant.BLANC()),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(color: Constant.BLANC()),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * .25,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '1256',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Constant.BLANC()),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Followings',
                                style: TextStyle(color: Constant.BLANC()),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .2,
                    width: size.width,

                    // color: Colors.red,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Container(
                          width: size.width * .85,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                width: size.width * .3,
                                height: size.height * .2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/home-tof.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: size.width * .3,
                                height: size.height * .2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/home-tof2.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: size.width * .3,
                                height: size.height * .2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image_plage.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .1,
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          width: size.width * .5,
                          height: size.height * .05,
                          child: Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Constant.BLANC(),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Spacer(),
                      ],
                    ),
                    // color: Colors.red,
                  ),
                  Spacer(),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
