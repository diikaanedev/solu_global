import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class WidgetDiscoverCategorie extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;

  const WidgetDiscoverCategorie({Key key, this.icon, this.text, this.color})
      : super(key: key);
  @override
  _WidgetDiscoverCategorieState createState() =>
      _WidgetDiscoverCategorieState();
}

class _WidgetDiscoverCategorieState extends State<WidgetDiscoverCategorie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          // color: Constant.BLUE(),
          child: Card(
            // color: Constant.BLUE(),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: constraints.maxHeight * .5,
                  width: constraints.maxWidth,
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color: Constant.BLANC(),
                      size: 40,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(.3),
                    // borderRadius: BorderRadius.circular(8)
                  ),
                ),
                Spacer(),
                Container(
                  height: constraints.maxHeight * .3,
                  width: constraints.maxWidth,
                  // color: Constant.BLUE(),
                  child: Center(
                    child: Text(
                      '${widget.text}',
                      style: TextStyle(),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
