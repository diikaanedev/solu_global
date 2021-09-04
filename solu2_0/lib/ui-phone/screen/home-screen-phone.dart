import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/home-button-nav-bar-widget.dart';
import 'package:solu2_0/ui-phone/widget/home-top-nav-bar-widget.dart';
import 'package:solu2_0/ui-phone/widget/post-home-social-link-widget.dart';
import 'package:solu2_0/ui-phone/widget/status-whattsap-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class HomeScreenPhone extends StatefulWidget {
  @override
  _HomeScreenPhoneState createState() => _HomeScreenPhoneState();
}

class _HomeScreenPhoneState extends State<HomeScreenPhone> {
  late ConstantByDii cons;
  late Size size;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: cons.rose(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: cons.blanc(),
          ),
          Positioned(
              child: Container(
            height: size.height * .07,
            width: size.width,
            child: HomeTopNavBarWidget(),
          )),
          Positioned(
              top: size.height * .07,
              child: Container(
                  height: size.height * .93,
                  width: size.width,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        height: size.height * .15,
                        width: size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                                width: size.width * .3,
                                height: size.height * .15,
                                child: StatusWhattssapWidget()),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                                width: size.width * .3,
                                height: size.height * .15,
                                child: StatusWhattssapWidget()),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                                width: size.width * .3,
                                height: size.height * .15,
                                child: StatusWhattssapWidget()),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                                width: size.width * .3,
                                height: size.height * .15,
                                child: StatusWhattssapWidget()),
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                                width: size.width * .3,
                                height: size.height * .15,
                                child: StatusWhattssapWidget()),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        child: PostHomeSocialLinkWidget(),
                      ),
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        child: PostHomeSocialLinkWidget(),
                      ),
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        child: PostHomeSocialLinkWidget(),
                      ),
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        child: PostHomeSocialLinkWidget(),
                      ),
                      SizedBox(
                        height: size.height * .1,
                      )
                    ],
                  ))),
          Positioned(
              bottom: size.height * .02,
              left: size.width * .1,
              child: Container(
                height: size.height * .05,
                width: size.width * .8,
                child: HomeButtonNavBarWidget(
                  intChoix: 0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cons.noir(),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: cons.grisFonce())
                    ]),
              ))
        ],
      ),
    );
  }
}
