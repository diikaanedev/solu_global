import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class UserAvatarEnLignePhoneWidget extends StatefulWidget {
  final String avatar, name;

  const UserAvatarEnLignePhoneWidget(
      {Key? key, required this.avatar, required this.name})
      : super(key: key);
  @override
  _UserAvatarEnLignePhoneWidgetState createState() =>
      _UserAvatarEnLignePhoneWidgetState();
}

class _UserAvatarEnLignePhoneWidgetState
    extends State<UserAvatarEnLignePhoneWidget> {
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
                child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.avatar),
              ),
            )),
            Positioned(
                bottom: constraints.maxHeight * .25,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                    width: constraints.maxWidth,
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: constraints.maxWidth * .12,
                            fontWeight: FontWeight.bold),
                      ),
                    )))
          ],
        ),
      );
}
