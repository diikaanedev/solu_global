import 'package:chopper/utils/colors-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceEventsHomeWidget extends StatefulWidget {
  final int price;
  final String uid;

  const PriceEventsHomeWidget(
      {Key? key, required this.price, required this.uid})
      : super(key: key);
  @override
  _PriceEventsHomeWidgetState createState() => _PriceEventsHomeWidgetState();
}

class _PriceEventsHomeWidgetState extends State<PriceEventsHomeWidget> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            // Text('${widget.price} CFA'),
            Spacer(),
            Container(
              height: constraints.maxHeight * .9,
              // width: constraints.maxWidth * .3,
              child: Center(
                child: Text(
                  (widget.uid != FirebaseAuth.instance.currentUser!.uid)
                      ? '  Acheter un ticket  '
                      : '  Inviter des amies  ',
                  style: TextStyle(
                      fontSize: constraints.maxWidth * .04,
                      color: colorsByDii.white(),
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: colorsByDii.grisCulture(),
                  borderRadius:
                      BorderRadius.circular(constraints.maxWidth * .1)),
            ),
            Spacer(),
          ],
        ),
      );
}
