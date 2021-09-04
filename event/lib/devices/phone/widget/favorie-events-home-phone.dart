import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavorieEventsHomePhone extends StatefulWidget {
  @override
  _FavorieEventsHomePhoneState createState() => _FavorieEventsHomePhoneState();
}

class _FavorieEventsHomePhoneState extends State<FavorieEventsHomePhone> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Center(
            child: Icon(Icons.favorite_border_rounded),
          ),
        ),
      );
}
