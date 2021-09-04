import 'package:qr_flutter/qr_flutter.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';

class CardTicketsWidgetPhone extends StatefulWidget {
  final String url, date, heure, lieux, data, name;

  const CardTicketsWidgetPhone(
      {Key? key,
      required this.url,
      required this.date,
      required this.heure,
      required this.name,
      required this.lieux,
      required this.data})
      : super(key: key);
  @override
  _CardTicketsWidgetPhoneState createState() => _CardTicketsWidgetPhoneState();
}

class _CardTicketsWidgetPhoneState extends State<CardTicketsWidgetPhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                left: constraints.maxWidth * .1,
                top: constraints.maxHeight * .05,
                child: Card(
                  borderOnForeground: false,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * .05)),
                  child: Container(
                    height: constraints.maxHeight * .85,
                    width: constraints.maxWidth * .8,
                    child: Column(
                      children: [
                        Container(
                          height: constraints.maxHeight * .5,
                          child: Column(
                            children: [
                              Container(
                                height: constraints.maxHeight * .3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(widget.url),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    )),
                              ),
                              Container(
                                height: constraints.maxHeight * .05,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth * .05,
                                    ),
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          color: ColorByDii.blanc(),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * .05,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth * .05,
                                    ),
                                    Text(
                                      'Date : ',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorByDii.gris(),
                                          fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      widget.date,
                                      style: TextStyle(
                                          color: ColorByDii.blanc(),
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Heure : ',
                                      style: TextStyle(
                                          color: ColorByDii.gris(),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      widget.heure,
                                      style: TextStyle(
                                          color: ColorByDii.blanc(),
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * .05,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth * .05,
                                    ),
                                    Text(
                                      'Lieux :',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorByDii.gris(),
                                          fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      widget.lieux,
                                      style: TextStyle(
                                          color: ColorByDii.blanc(),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: constraints.maxHeight * .35,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                'Votre QR billet',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .03,
                                    color: ColorByDii.blanc()),
                              ),
                              Spacer(),
                              Container(
                                height: constraints.maxHeight * .2,
                                width: constraints.maxWidth * .6,
                                child: Center(
                                  child: QrImage(
                                    data: widget.data,
                                    foregroundColor: ColorByDii.blanc(),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Ne pas montrez ou bien partager !',
                                style: TextStyle(
                                    fontSize: 10, color: ColorByDii.blanc()),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.circular(constraints.maxWidth * .05)),
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .5,
                left: constraints.maxWidth * .03,
                child: Container(
                  height: constraints.maxWidth * .15,
                  width: constraints.maxWidth * .15,
                  decoration: BoxDecoration(
                    color: ColorByDii.blanc(),
                    borderRadius: BorderRadius.circular(constraints.maxWidth),
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .5,
                right: constraints.maxWidth * .03,
                child: Container(
                  height: constraints.maxWidth * .15,
                  width: constraints.maxWidth * .15,
                  decoration: BoxDecoration(
                    color: ColorByDii.blanc(),
                    borderRadius: BorderRadius.circular(constraints.maxWidth),
                  ),
                )),
            Positioned(
                top: constraints.maxHeight * .55,
                left: constraints.maxWidth * .19,
                child: Container(
                  height: 1,
                  width: constraints.maxWidth * .68,
                  child: Row(
                    children: List.generate(
                      (constraints.maxWidth * .64).floor() ~/ 16,
                      (index) => Container(
                        width: 10,
                        height: 1,
                        color: ColorByDii.gris(),
                        margin: EdgeInsets.only(left: 3, right: 3),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      );
}
