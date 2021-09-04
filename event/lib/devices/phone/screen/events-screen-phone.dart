import 'package:event/devices/phone/widget/card-search-event-widget-home-phone.dart';
import 'package:event/devices/phone/widget/menu-botton-widget-phone.dart';
import 'package:event/devices/phone/widget/search-widget-phone.dart';
import 'package:event/devices/phone/widget/titre-search-widget-phone.dart';
import 'package:event/devices/phone/widget/top-bar-events-widget-phone.dart';
import 'package:event/devices/phone/widget/type-events-search-home-widget-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class EventsScreenPhone extends StatefulWidget {
  @override
  _EventsScreenPhoneState createState() => _EventsScreenPhoneState();
}

class _EventsScreenPhoneState extends State<EventsScreenPhone> {
  late Size size;
  int i = 1;
  @override
  Widget build(BuildContext context) {
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
            height: size.height * .07,
            width: size.width,
            child: TopBarEventsWidgetPhone(),
          )),
          Positioned(
              top: size.height * .08,
              child: Container(
                height: size.height * .05,
                width: size.width,
                child: SearchWidgetPhone(),
              )),
          Positioned(
              top: (size.height * .2) - .25,
              child: Container(
                height: .5,
                width: size.width,
                color: ColorByDii.gris(),
              )),
          Positioned(
              top: size.height * .15,
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
                          width: constraints.maxWidth * .2,
                          child: TypeEventsSearchHomeWidgetPhone(
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
                          width: constraints.maxWidth * .2,
                          child: TypeEventsSearchHomeWidgetPhone(
                              text: 'Favories', isValid: i == 1),
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
                          width: constraints.maxWidth * .2,
                          child: TypeEventsSearchHomeWidgetPhone(
                              text: 'Participer', isValid: i == 2),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: size.height * .22,
              child: Container(
                height: size.height * .78,
                width: size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: size.height * .05,
                            child: TitreSearchWidgetPhone(text: 'Juin'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Container(
                                width: size.width,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-22h',
                                            date: '19 Juin',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name:
                                                'Personal Branding - Oser le marketing de soi',
                                            url:
                                                'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F135082959%2F540454490249%2F1%2Foriginal.20210511-234420?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=4bd1ebd25e4cdfe8d6797fb8715d541d'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '23h-05h',
                                            date: '27 Juin',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name: 'The Show fo the years',
                                            url:
                                                'https://pbs.twimg.com/media/EUIH8JaWsAIQvwA.jpg'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-22h',
                                            date: '30 Juin',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name: 'Journey to Dakar, Senegal',
                                            url:
                                                'https://images.squarespace-cdn.com/content/v1/55b58420e4b02fb2e1559ddc/1562697916618-WMTGARXD2R9ABLQXCCQA/ke17ZwdGBToddI8pDm48kFTEgwhRQcX9r3XtU0e50sUUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcjVvFZn3_1TpSINbj1p15LLAjcj6UHNkQOuDz3gO52lBvccB2t33iJEaqs_Hdgp_g/Copy+of+goes+to+johannesburg-2.png?format=1000w'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-23h',
                                            date: '31 Juin',
                                            invite: 30,
                                            lieux: 'Dakar, Dakar-Plateau ',
                                            name: 'SENEGAL HOLIDAY TOUR 2021',
                                            url:
                                                'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F133702645%2F164668628727%2F1%2Foriginal.20210428-212208?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C66%2C800%2C400&s=fa01e4ed5755dad422325b7602550dd2'),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: size.height * .05,
                            child: TitreSearchWidgetPhone(text: 'Juilliet'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Container(
                                width: size.width,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-22h',
                                            date: '19 Juilliet',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name:
                                                'Personal Branding - Oser le marketing de soi',
                                            url:
                                                'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F135082959%2F540454490249%2F1%2Foriginal.20210511-234420?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C2160%2C1080&s=4bd1ebd25e4cdfe8d6797fb8715d541d'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '23h-05h',
                                            date: '27 Juilliet',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name: 'The Show fo the years',
                                            url:
                                                'https://pbs.twimg.com/media/EUIH8JaWsAIQvwA.jpg'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-22h',
                                            date: '30 Juilliet',
                                            invite: 240,
                                            lieux: 'Pikine',
                                            name: 'Journey to Dakar, Senegal',
                                            url:
                                                'https://images.squarespace-cdn.com/content/v1/55b58420e4b02fb2e1559ddc/1562697916618-WMTGARXD2R9ABLQXCCQA/ke17ZwdGBToddI8pDm48kFTEgwhRQcX9r3XtU0e50sUUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcjVvFZn3_1TpSINbj1p15LLAjcj6UHNkQOuDz3gO52lBvccB2t33iJEaqs_Hdgp_g/Copy+of+goes+to+johannesburg-2.png?format=1000w'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        child: CardSearchEventWidgetHomePhone(
                                            heure: '10h-23h',
                                            date: '31 Juilliet',
                                            invite: 30,
                                            lieux: 'Dakar, Dakar-Plateau ',
                                            name: 'SENEGAL HOLIDAY TOUR 2021',
                                            url:
                                                'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F133702645%2F164668628727%2F1%2Foriginal.20210428-212208?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C66%2C800%2C400&s=fa01e4ed5755dad422325b7602550dd2'),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
          height: size.height * .07,
          width: size.width * .8,
          decoration: BoxDecoration(color: ColorByDii.blanc(), boxShadow: [
            BoxShadow(color: ColorByDii.blanc(), blurRadius: 20)
          ]),
          child: MenuBottomWidgetPhone(
            screenChoix: 1,
          )),
    );
  }
}
