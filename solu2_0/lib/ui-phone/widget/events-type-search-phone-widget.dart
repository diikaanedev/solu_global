import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class EventTypeSearchPhoneWidget extends StatefulWidget {
  @override
  _EventTypeSearchPhoneWidgetState createState() =>
      _EventTypeSearchPhoneWidgetState();
}

class _EventTypeSearchPhoneWidgetState
    extends State<EventTypeSearchPhoneWidget> {
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
        builder: (context, constraints) => Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Container(
              width: constraints.maxWidth * .3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/media/EKKIyi8WkAAdOUA.jpg'),
                      fit: BoxFit.fill),
                  color: cons.noir(),
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
                          '27 Décembre',
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '23h',
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .03,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .03,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          '05h',
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
                        Text(
                          'The Show of the years'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxHeight * .08),
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
                        Icon(Icons.pin_drop_outlined),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Text('4 km distance')
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
                            backgroundColor: cons.noir(),
                            backgroundImage: NetworkImage(
                                'https://image.freepik.com/photos-gratuite/vue-face-personne-noire-portant-masque_23-2148749565.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .05,
                          child: CircleAvatar(
                            backgroundColor: cons.rose(),
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/originals/6a/9b/4d/6a9b4d05007138a3dacd7847aa8f0036.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .1,
                          child: CircleAvatar(
                            backgroundColor: cons.gris(),
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg901L4yBxZC83UJuA-Tb3W3gokGaxUm61gw&usqp=CAU'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .15,
                          child: CircleAvatar(
                            backgroundColor: cons.noir(),
                            backgroundImage: NetworkImage(
                                'https://www.paulworpole.com/wp-content/uploads/2017/01/Portrait-of-Woman-with-Smock-Dress-%C2%A9-Paul-Worpole.jpg'),
                          ),
                        ),
                        Positioned(
                          left: constraints.maxWidth * .2,
                          child: CircleAvatar(
                            backgroundColor: cons.gris(),
                            child: Center(
                              child: Text(
                                '+240',
                                style: TextStyle(
                                    color: cons.noir(),
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
