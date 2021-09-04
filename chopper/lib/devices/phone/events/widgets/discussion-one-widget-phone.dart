import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class DiscussionOneWidgetPhone extends StatefulWidget {
  final String username, message, date;

  const DiscussionOneWidgetPhone(
      {Key? key,
      required this.username,
      required this.message,
      required this.date})
      : super(key: key);
  @override
  _DiscussionOneWidgetPhoneState createState() =>
      _DiscussionOneWidgetPhoneState();
}

class _DiscussionOneWidgetPhoneState extends State<DiscussionOneWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Container(
              width: constraints.maxWidth * .15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(6)),
            ),
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Container(
              width: constraints.maxWidth * .7,
              child: Column(
                children: [
                  Container(
                      width: constraints.maxWidth * .7,
                      height: constraints.maxHeight * .5,
                      child: Row(
                        children: [
                          Container(
                              height: constraints.maxHeight * .5,
                              child: RichText(
                                  text: TextSpan(
                                      text: '${widget.username}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: colorsByDii.eerieBlack()),
                                      children: [
                                    TextSpan(
                                        text: ' , ${widget.message}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100))
                                  ])))
                        ],
                      )),
                  Container(
                      width: constraints.maxWidth * .7,
                      child: Row(
                        children: [
                          Text('${widget.date}min'),
                          SizedBox(
                            width: constraints.maxWidth * .02,
                          ),
                          Text(
                            'Répondre',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      );
}
