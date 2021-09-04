import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/devices/phone/widget/card-one-event-recommended-widget-phone.dart';
import 'package:event/devices/phone/widget/participant-events-home-phone.dart';
import 'package:event/devices/phone/widget/profile-one-event-widget-phone.dart';
import 'package:event/devices/phone/widget/titre-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:event/utils/constant-collection-by-dii.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OneEventScreenPhone extends StatefulWidget {
  const OneEventScreenPhone({
    Key? key,
  }) : super(key: key);

  @override
  _OneEventScreenPhoneState createState() => _OneEventScreenPhoneState();
}

class _OneEventScreenPhoneState extends State<OneEventScreenPhone> {
  late Size size;

  String urlAvatar = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    FirebaseFirestore.instance
        .collection(USERS_COLLECTION)
        .doc(args['creator'])
        .get()
        .then((value) {
      setState(() {
        username = value.get('username');
        urlAvatar = value.get('urlAvatar');
      });
    });
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
        backgroundColor: ColorByDii.blanc(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: ColorByDii.blanc(),
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: size.height * 1.9,
                  width: size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * .3,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(8)),
                            image: DecorationImage(
                                image: NetworkImage(args['events'][0]),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: size.height * .05,
                          width: size.width,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .05,
                              ),
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Text(
                                'Retour',
                                style: TextStyle(color: ColorByDii.blanc()),
                              )
                            ],
                          ),
                        ),
                      )),
                      Positioned(
                          top: size.height * .27,
                          child: Container(
                            // height: size.height * .5,
                            width: size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Container(
                                  // height: size.height * .05,
                                  width: size.width * .9,
                                  child: Text(
                                    args['events'][1],
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: (size.height * .07) * .35),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: size.height * .05,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth * .05,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: ColorByDii.blanc(),
                                          child: Center(
                                            child: Icon(
                                              Icons.lock_clock,
                                              color: ColorByDii.noir(),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          args['date'][3],
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .4,
                                              color: ColorByDii.noir()),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .02,
                                        ),
                                        Text(
                                          args['date'][0],
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .4,
                                              color: ColorByDii.noir()),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .02,
                                        ),
                                        Text(
                                          args['date'][1],
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .4,
                                              color: ColorByDii.noir()),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .02,
                                        ),
                                        Text(
                                          args['date'][2],
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .4,
                                              color: ColorByDii.noir()),
                                        ),
                                        Spacer(),
                                        CircleAvatar(
                                          backgroundColor: ColorByDii.blanc(),
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: ColorByDii.noir(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .05,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: .3,
                                  width: size.width * .9,
                                  color: ColorByDii.gris(),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .9,
                                  child: ParticipantEventHomePhone(
                                    idEvent: args['events'][7],
                                    invite: args['events'][3],
                                    keyEvent: args['events'][5],
                                    uid: args['events'][6],
                                  ),
                                  // color: Colors.red,
                                ),
                                SizedBox(height: size.height * .02),
                                Container(
                                  height: size.height * .05,
                                  child: TitreWidgetPhone(
                                      titre: 'Événément crée par'),
                                ),
                                SizedBox(height: size.height * .02),
                                Container(
                                  height: size.height * .07,
                                  child: ProfileOneEventWidgetPhone(
                                    user: [urlAvatar, username, '2'],
                                  ),
                                ),
                                SizedBox(height: size.height * .02),
                                Container(
                                  height: size.height * .05,
                                  child: TitreWidgetPhone(titre: 'A propos'),
                                ),
                                Container(
                                  width: size.width * .9,
                                  child: Text(
                                    "${args['events'][2]} ${args['events'][2]} ${args['events'][2]} ${args['events'][2]}",
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        color: ColorByDii.noir(),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .03,
                                ),
                                Container(
                                  height: .3,
                                  width: size.width * .9,
                                  color: ColorByDii.gris(),
                                ),
                                SizedBox(
                                  height: size.height * .03,
                                ),
                                Container(
                                  height: size.height * .05,
                                  child: TitreWidgetPhone(
                                      titre: 'Recommandé pour vous'),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Container(
                                  height: size.height * .32,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Container(
                                        width: size.width * .5,
                                        child:
                                            CardOneEventRecommendedWidgetPhone(
                                          url:
                                              'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F111613735%2F318735822267%2F1%2Foriginal.20200314-170045?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C256%2C5330%2C2665&s=c168f6282ca2e7de28e67d425dc23f73',
                                          name: 'It Conference',
                                          invite: '290',
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                      Container(
                                        width: size.width * .5,
                                        child:
                                            CardOneEventRecommendedWidgetPhone(
                                          url:
                                              'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F132312685%2F195932407905%2F1%2Foriginal.20201229-102110?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C500%2C6000%2C3000&s=565c0af2c55d823395ef7af779586030',
                                          name: 'Music Party',
                                          invite: '754',
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .02,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .05,
                                ),
                                if (!args['events'][4])
                                  Container(
                                    height: size.height * .1,
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: size.height * .07,
                                          width: size.width * .6,
                                          child: Center(
                                            child: Text(
                                              'Acheter votre ticket',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: ColorByDii.blanc()),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorByDii.noir(),
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: ColorByDii.blanc(),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                )),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      // bottomNavigationBar: Container(
      //     height: size.height * .07,
      //     width: size.width * .8,
      //     decoration: BoxDecoration(color: ColorByDii.blanc(), boxShadow: [
      //       BoxShadow(color: ColorByDii.blanc(), blurRadius: 20)
      //     ]),
      //     child: MenuBottomWidgetPhone(
      //       screen_choix: 1,
      //     )),
    );
  }
}
