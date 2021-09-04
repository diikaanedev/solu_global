import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class StatusWhattssapWidget extends StatefulWidget {
  @override
  _StatusWhattssapWidgetState createState() => _StatusWhattssapWidgetState();
}

class _StatusWhattssapWidgetState extends State<StatusWhattssapWidget> {
  late ConstantByDii cons;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              // color: cons.gris(),
            ),
            Positioned(
                left: constraints.maxWidth * .2,
                top: constraints.maxHeight * .1,
                child: Container(
                  height: constraints.maxWidth * .6,
                  width: constraints.maxWidth * .6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.wallpapertip.com/wmimgs/141-1418814_bhojpuri-actress-hd-wallpaper-photo-image-sanchita-banerjee.jpg'),
                        fit: BoxFit.fill),
                    boxShadow: [BoxShadow(blurRadius: 2, color: cons.blanc())],
                    // borderRadius: BorderRadius.circular(constraints.maxHeight),
                    borderRadius: BorderRadius.circular(8),
                    color: cons.noir(),
                  ),
                )),
            Positioned(
                bottom: constraints.maxHeight * .1,
                child: Container(
                  width: constraints.maxWidth,
                  child: Center(
                    child: Text(
                      'diikaanedev',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: cons.gris(),
                          fontSize: constraints.maxHeight * .12),
                    ),
                  ),
                ))
          ],
        ),
      );
}
