import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class StorieHomeWidget extends StatefulWidget {
  final bool isLive;
  final String urlAvatar, name;

  final List<String> url;

  const StorieHomeWidget(
      {Key? key,
      required this.isLive,
      required this.urlAvatar,
      required this.url,
      required this.name})
      : super(key: key);
  @override
  _StorieHomeWidgetState createState() => _StorieHomeWidgetState();
}

class _StorieHomeWidgetState extends State<StorieHomeWidget> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            ),
            Positioned(
                child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.url[0]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)),
            )),
            Positioned(
                top: constraints.maxHeight * .05,
                right: constraints.maxWidth * .05,
                child: Container(
                  height: constraints.maxHeight * .1,
                  width: constraints.maxWidth * .2,
                  child: Center(
                      child: CircleAvatar(
                    backgroundColor: colorsByDii.sizzlingRed(),
                    child: Text(widget.url.length.toString()),
                  )),
                )),
            Positioned(
                bottom: constraints.maxHeight * .05,
                child: Container(
                  height: constraints.maxHeight * .2,
                  width: constraints.maxWidth,
                  // color: colorsByDii.raisinBlack(),
                  child: Row(
                    children: [
                      Spacer(),
                      CircleAvatar(
                        radius: constraints.maxWidth * .1,
                        backgroundImage: NetworkImage(widget.urlAvatar),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .05,
                      ),
                      Text(
                        '${widget.name}',
                        style: TextStyle(color: colorsByDii.white()),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      );
}
