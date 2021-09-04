import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/widgets.dart';

class CategoriesListWidgetPhoneSOLU extends StatefulWidget {
  final String url, titre;
  const CategoriesListWidgetPhoneSOLU(
      {Key? key, required this.url, required this.titre})
      : super(key: key);

  @override
  _CategoriesListWidgetPhoneSOLUState createState() =>
      _CategoriesListWidgetPhoneSOLUState();
}

class _CategoriesListWidgetPhoneSOLUState
    extends State<CategoriesListWidgetPhoneSOLU> {
  ColorsByDii colorsByDii = ColorsByDii();
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
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .8,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * .2),
                      image: DecorationImage(image: NetworkImage(widget.url)),
                      color: colorsByDii.grisCulture()),
                )),
            Positioned(
                bottom: constraints.maxHeight * .02,
                child: Container(
                  height: constraints.maxHeight * .3,
                  width: constraints.maxWidth,
                  child: Center(
                    child: Text(
                      '${widget.titre}',
                      style: TextStyle(fontSize: constraints.maxHeight * .1),
                    ),
                  ),
                ))
          ],
        ),
      );
}
