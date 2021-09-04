import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ButtomCreateEvent extends StatefulWidget {
  @override
  _ButtomCreateEventState createState() => _ButtomCreateEventState();
}

class _ButtomCreateEventState extends State<ButtomCreateEvent> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Carousel(
                dotBgColor: Colors.transparent,
                dotSize: .0,
                autoplayDuration: Duration(seconds: 10),
                animationDuration: Duration(milliseconds: 300),
                images: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6-rHcK5voJmzk3SzJjinmoQPfbGfS12fudQ&usqp=CAU'),
                    fit: BoxFit.cover,
                  ))),
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuuAxguIi-cd3JoGyzYPLTgZ_94hvIXPCO19CdO6jAp8BmZurikPDq9M8zW-JndfCkbiw&usqp=CAU'),
                    fit: BoxFit.cover,
                  ))),
                  // Container(
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //   image: NetworkImage(
                  //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThVV8g8erfLdxTOMv8rQcStST75_XtJR8FGw&usqp=CAU'),
                  //   fit: BoxFit.cover,
                  // ))),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: constraints.maxHeight * .15,
                decoration: BoxDecoration(
                    color: colorsByDii.eerieBlack(),
                    borderRadius: BorderRadius.circular(8)),
                // width: constraints.maxWidth * ,
                child: Center(
                  child: Text(
                    '  C\'est partie !  ',
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .07,
                        color: colorsByDii.white()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
