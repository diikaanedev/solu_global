import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardSearchEventWidgetHomePhone extends StatefulWidget {
  final String date;
  final String heure;
  final String name;
  final String lieux;
  final String url;
  final int invite;

  const CardSearchEventWidgetHomePhone(
      {Key? key,
      required this.date,
      required this.heure,
      required this.name,
      required this.lieux,
      required this.invite,
      required this.url})
      : super(key: key);
  @override
  _CardSearchEventWidgetHomePhoneState createState() =>
      _CardSearchEventWidgetHomePhoneState();
}

class _CardSearchEventWidgetHomePhoneState
    extends State<CardSearchEventWidgetHomePhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Container(
              width: constraints.maxWidth * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.url), fit: BoxFit.fill),
                  color: colorsByDii.eerieBlack(),
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: constraints.maxWidth * .02,
            ),
            Container(
              width: constraints.maxWidth * .6,
              child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight * .2,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Text(
                          widget.date,
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          widget.heure,
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .03,
                              fontWeight: FontWeight.w100),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                      ],
                    ),
                    // color: cons.rose(),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .1,
                  ),
                  Container(
                    width: constraints.maxWidth * .6,
                    // height: constraints.maxHeight * .25,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Container(
                          width: constraints.maxWidth * .58,
                          child: Text(
                            widget.name.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: constraints.maxHeight * .06),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * .2,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Icon(
                          Icons.pin_drop_outlined,
                          size: 12,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Text(
                          widget.lieux,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxHeight * .05),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .05,
                  ),
                  Container(
                    height: constraints.maxHeight * .3,
                    child: Stack(
                      children: [
                        Container(
                          height: constraints.maxHeight * .3,
                          width: constraints.maxWidth,
                        ),
                        Positioned(
                          child: CircleAvatar(
                            backgroundColor: colorsByDii.eerieBlack(),
                            radius: constraints.maxWidth * .05,
                            backgroundImage: NetworkImage(
                                'https://image.freepik.com/photos-gratuite/vue-face-personne-noire-portant-masque_23-2148749565.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .05,
                          child: CircleAvatar(
                            backgroundColor: colorsByDii.grisCulture(),
                            radius: constraints.maxWidth * .05,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/6a/9b/4d/6a9b4d05007138a3dacd7847aa8f0036.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .1,
                          child: CircleAvatar(
                            backgroundColor: colorsByDii.grisCulture(),
                            radius: constraints.maxWidth * .05,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg901L4yBxZC83UJuA-Tb3W3gokGaxUm61gw&usqp=CAU'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .15,
                          child: CircleAvatar(
                            backgroundColor: colorsByDii.eerieBlack(),
                            radius: constraints.maxWidth * .05,
                            backgroundImage: NetworkImage(
                                'https://www.paulworpole.com/wp-content/uploads/2017/01/Portrait-of-Woman-with-Smock-Dress-%C2%A9-Paul-Worpole.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .2,
                          child: CircleAvatar(
                            backgroundColor: colorsByDii.grisCulture(),
                            radius: constraints.maxWidth * .05,
                            child: Center(
                              child: Text(
                                '+${widget.invite}',
                                style: TextStyle(
                                    color: colorsByDii.eerieBlack(),
                                    fontSize: constraints.maxHeight * .07),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
