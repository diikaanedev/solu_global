import 'package:chopper/devices/phone/events/widgets/participant-events-home-phone.dart';
import 'package:chopper/devices/phone/events/widgets/price-events-home-widget.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardEventsHomeWidgetPhone extends StatefulWidget {
  final String url, name, description;
  final List<String> date;
  final int price, invite;
  final bool isFree;
  final String uid;
  final String idEvent, keyEvent;

  const CardEventsHomeWidgetPhone(
      {Key? key,
      required this.url,
      required this.name,
      required this.description,
      required this.date,
      required this.price,
      required this.invite,
      required this.isFree,
      required this.uid,
      required this.idEvent,
      required this.keyEvent})
      : super(key: key);
  @override
  _CardEventsHomeWidgetPhoneState createState() =>
      _CardEventsHomeWidgetPhoneState();
}

class _CardEventsHomeWidgetPhoneState extends State<CardEventsHomeWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/event/one', arguments: {
          'date': widget.date,
          'events': [
            widget.url,
            widget.name,
            widget.description,
            widget.invite,
            widget.isFree,
            widget.keyEvent,
            widget.uid,
            widget.idEvent
          ],
          'creator': widget.uid
        }),
        child: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Card(
              elevation: 2,
              shadowColor: colorsByDii.grisCulture().withOpacity(.2),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(constraints.maxWidth * .05)),
              child: Stack(
                children: [
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                  ),
                  Positioned(
                      child: Container(
                    height: constraints.maxHeight * .4,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.url), fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(constraints.maxWidth * .05),
                            topLeft:
                                Radius.circular(constraints.maxWidth * .05))),
                  )),
                  Positioned(
                      child: Container(
                    height: constraints.maxHeight * .1,
                    width: constraints.maxWidth * .3,
                    child: Center(
                        child: Text(
                      widget.isFree ? 'Gratuit' : 'Payant',
                      style: TextStyle(
                          fontSize: constraints.maxWidth * .04,
                          fontWeight: FontWeight.bold,
                          color: colorsByDii.white()),
                    )),
                    decoration: BoxDecoration(
                        color: colorsByDii.grisCulture().withOpacity(.2),
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(constraints.maxWidth * .05),
                            bottomRight:
                                Radius.circular(constraints.maxWidth * .1))),
                  )),
                  Positioned(
                    top: constraints.maxHeight * .4,
                    child: Container(
                        height: constraints.maxHeight * .5,
                        width: constraints.maxWidth * .9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * .05,
                            ),
                            Container(
                                width: constraints.maxWidth * .8,
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .04,
                                      fontWeight: FontWeight.bold,
                                      color: colorsByDii.eerieBlack()),
                                )),
                            SizedBox(
                              height: constraints.maxHeight * .03,
                            ),
                            Container(
                                width: constraints.maxWidth * .8,
                                child: Text(
                                  widget.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .03,
                                      fontWeight: FontWeight.w300,
                                      color: colorsByDii.eerieBlack()),
                                )),
                            SizedBox(
                              height: constraints.maxHeight * .05,
                            ),
                            Container(
                              height: constraints.maxHeight * .1,
                              width: constraints.maxWidth * .8,
                              child: Row(
                                children: [
                                  Container(
                                      width: constraints.maxWidth * .5,
                                      height: constraints.maxHeight * .1,
                                      child: ParticipantEventHomePhone(
                                        invite: widget.invite,
                                        keyEvent: widget.keyEvent,
                                        idEvent: widget.idEvent,
                                        uid: widget.uid,
                                      )),
                                ],
                              ),
                              // color: Colors.blue,
                            ),
                            Spacer(),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: colorsByDii.white(),
                        )),
                  ),
                  Positioned(
                      bottom: constraints.maxHeight * .07,
                      right: constraints.maxHeight * .03,
                      child: Card(
                        elevation: .5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                constraints.maxHeight * .01)),
                        child: Container(
                          height: constraints.maxHeight * .2,
                          width: constraints.maxWidth * .18,
                          decoration: BoxDecoration(
                              color: colorsByDii.white(),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxHeight * .01)),
                          child: Column(
                            children: [
                              Container(
                                height: constraints.maxHeight * .050,
                                width: constraints.maxWidth,
                                child: Center(
                                    child: Text(
                                  '${widget.date[3]}',
                                  style: TextStyle(
                                      color: colorsByDii.white(),
                                      fontSize: constraints.maxHeight * .03),
                                )),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          constraints.maxHeight * .01),
                                      topRight: Radius.circular(
                                          constraints.maxHeight * .01),
                                    )),
                              ),
                              Spacer(),
                              Text('${widget.date[1]}'),
                              SizedBox(
                                height: constraints.maxHeight * .01,
                              ),
                              Text('${widget.date[0]}'),
                              Spacer(),
                            ],
                          ),
                        ),
                      )),
                  widget.isFree
                      ? Container()
                      : Positioned(
                          bottom: constraints.maxHeight * .03,
                          child: Container(
                            height: constraints.maxHeight * .09,
                            width: constraints.maxWidth * .8,
                            child: PriceEventsHomeWidget(
                              price: widget.price,
                              uid: widget.uid,
                            ),
                          ))
                ],
              ),
            ),
          ),
        ),
      );
}
