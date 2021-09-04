import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/events-type-search-phone-widget.dart';
import 'package:solu2_0/ui-phone/widget/home-button-nav-bar-widget.dart';
import 'package:solu2_0/ui-phone/widget/people-type-search-phone-widget.dart';
import 'package:solu2_0/ui-phone/widget/post-home-social-link-widget.dart';
import 'package:solu2_0/ui-phone/widget/search-field-phone-widget.dart';
import 'package:solu2_0/ui-phone/widget/titre-type-search-phone-widget.dart';
import 'package:solu2_0/ui-phone/widget/type-search-item-phone-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

late _SearchScreenPhoneState screenPhoneState;

class SearchScreenPhone extends StatefulWidget {
  @override
  _SearchScreenPhoneState createState() => _SearchScreenPhoneState();
}

class _SearchScreenPhoneState extends State<SearchScreenPhone> {
  late ConstantByDii cons;
  late Size size;
  late int i = 0;

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
        toolbarHeight: .0,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: cons.blanc(),
          ),
          Positioned(
              top: size.height * .01,
              child: Container(
                height: size.height * .05,
                width: size.width,
                child: SearchFieldPhoneWidget(),
              )),
          Positioned(
              top: size.height * .07,
              child: Container(
                height: size.height * .05,
                width: size.width,
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 0;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .1,
                          child: TYpeSearchItemPhoneWidget(
                              text: 'Tout', isValid: i == 0),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 1;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .19,
                          child: TYpeSearchItemPhoneWidget(
                              text: 'Personnes', isValid: i == 1),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 2;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .1,
                          child: TYpeSearchItemPhoneWidget(
                              text: 'Posts', isValid: i == 2),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            i = 3;
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth * .13,
                          child: TYpeSearchItemPhoneWidget(
                              text: 'Events', isValid: i == 3),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: size.height * .12,
              child: i == 0
                  ? Container(
                      height: size.height * .9,
                      width: size.width,
                      // color: cons.gris(),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: size.height * .05,
                            child:
                                TitreTYpeSearchPhoneWidget(text: 'Personnes'),
                          ),
                          Container(
                            height: size.height * .08,
                            child: PeopleTypeSearchPhoneWidget(),
                          ),
                          Container(
                            height: size.height * .08,
                            child: PeopleTypeSearchPhoneWidget(),
                          ),
                          Container(
                            height: size.height * .08,
                            child: PeopleTypeSearchPhoneWidget(),
                          ),
                          Container(
                            height: size.height * .08,
                            child: PeopleTypeSearchPhoneWidget(),
                          ),
                          Container(
                            height: size.height * .05,
                            child: TitreTYpeSearchPhoneWidget(text: 'Posts'),
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
                            height: size.height * .05,
                            child: TitreTYpeSearchPhoneWidget(text: 'Events'),
                          ),
                          Container(
                            height: size.height * .2,
                            width: size.width,
                            child: EventTypeSearchPhoneWidget(),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Container(
                            height: size.height * .2,
                            width: size.width,
                            child: EventTypeSearchPhoneWidget(),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Container(
                            height: size.height * .2,
                            width: size.width,
                            child: EventTypeSearchPhoneWidget(),
                          ),
                          SizedBox(
                            height: size.height * .2,
                          )
                        ],
                      ),
                    )
                  : i == 1
                      ? Container(
                          height: size.height * .9,
                          width: size.width,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Container(
                                height: size.height * .05,
                                child: TitreTYpeSearchPhoneWidget(
                                    text: 'Personnes'),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              Container(
                                height: size.height * .08,
                                child: PeopleTypeSearchPhoneWidget(),
                              ),
                              SizedBox(
                                height: size.height * .1,
                              )
                            ],
                          ),
                        )
                      : i == 2
                          ? Container(
                              height: size.height * .9,
                              width: size.width,
                              child: ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  Container(
                                    height: size.height * .05,
                                    child: TitreTYpeSearchPhoneWidget(
                                        text: 'Posts'),
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
                                    height: size.height * .2,
                                  )
                                ],
                              ),
                            )
                          : i == 3
                              ? Container(
                                  height: size.height * .9,
                                  width: size.width,
                                  // color: cons.rose(),
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      Container(
                                        height: size.height * .05,
                                        child: TitreTYpeSearchPhoneWidget(
                                            text: 'Events'),
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Container(
                                        height: size.height * .2,
                                        width: size.width,
                                        child: EventTypeSearchPhoneWidget(),
                                      ),
                                      SizedBox(
                                        height: size.height * .2,
                                      )
                                    ],
                                  ),
                                )
                              : Container()),
          Positioned(
              bottom: size.height * .02,
              left: size.width * .1,
              child: Container(
                height: size.height * .05,
                width: size.width * .8,
                child: HomeButtonNavBarWidget(
                  intChoix: 1,
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
