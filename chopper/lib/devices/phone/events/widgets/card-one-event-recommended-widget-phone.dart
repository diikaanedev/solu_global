import 'package:chopper/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardOneEventRecommendedWidgetPhone extends StatefulWidget {
  final String url, name, invite;

  const CardOneEventRecommendedWidgetPhone(
      {Key? key, required this.url, required this.name, required this.invite})
      : super(key: key);
  @override
  _CardOneEventRecommendedWidgetPhoneState createState() =>
      _CardOneEventRecommendedWidgetPhoneState();
}

class _CardOneEventRecommendedWidgetPhoneState
    extends State<CardOneEventRecommendedWidgetPhone> {
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Card(
          elevation: 1,
          shadowColor: colorsByDii.white(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colorsByDii.white(),
                    borderRadius: BorderRadius.circular(8)),
              ),
              Positioned(
                  child: Container(
                height: constraints.maxHeight * .6,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    // color: colorsByDii.eerieBlack(),
                    image: DecorationImage(
                        image: NetworkImage(widget.url), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
              )),
              Positioned(
                  top: constraints.maxHeight * .6,
                  child: Container(
                    height: constraints.maxHeight * .4,
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Container(
                            // height: constraints.maxHeight * .1,
                            width: constraints.maxWidth * .9,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: colorsByDii.eerieBlack(),
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxHeight * .06),
                              overflow: TextOverflow.ellipsis,
                            )),
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        ),
                        Container(
                            height: constraints.maxHeight * .2,
                            width: constraints.maxWidth,
                            // color: Colors.red,
                            child: Stack(
                              children: [
                                Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                ),
                                Positioned(
                                    left: constraints.maxWidth * .02,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://i.pinimg.com/236x/dd/f6/0d/ddf60d1f007753160df98e83958d6abd.jpg'),
                                    )),
                                Positioned(
                                    left: constraints.maxWidth * .06,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwtwc1gJ6qZUwZtT1N7GHgpAOrEKbnbFxGhK253uPVSC4uWdjKcsUuO-Mc_MCpMRBWjKk&usqp=CAU'),
                                    )),
                                Positioned(
                                    left: constraints.maxWidth * .1,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://expertphotography.com/wp-content/uploads/2020/08/social-media-profile-photos-9.jpg'),
                                    )),
                                Positioned(
                                    left: constraints.maxWidth * .14,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://www.adecco.ca/-/media/adeccogroup/brands/adecco-global-2016/canada/media/images/blog/why-linkedin-is-important-for-personal-branding.jpg'),
                                    )),
                                Positioned(
                                    left: constraints.maxWidth * .18,
                                    child: CircleAvatar(
                                      backgroundColor: colorsByDii.eerieBlack(),
                                      child: Center(
                                        child: Text(
                                          '${widget.invite}+',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .04),
                                        ),
                                      ),
                                    )),
                                Positioned(
                                    left: constraints.maxWidth * .5,
                                    top: constraints.maxHeight * .01,
                                    child: Container(
                                      width: constraints.maxWidth * .4,
                                      height: constraints.maxHeight * .1,
                                      // color: colorsByDii.eerieBlack(),
                                      child: Center(
                                        child: Text(
                                          'Participer',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .05,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                        Spacer(),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
                  ))
            ],
          ),
        ),
      );
}
