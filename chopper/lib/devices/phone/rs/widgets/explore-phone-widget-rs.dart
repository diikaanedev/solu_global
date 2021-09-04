import 'package:chopper/devices/phone/rs/screens/add-collection-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/comment-explore-widget-rs.dart';
import 'package:chopper/devices/phone/rs/widgets/menu-btn-hoome-widget-rs.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExplorePhoneWidgetRS extends StatefulWidget {
  final String url, name, avatar, id;
  final List likes, comments, vues;

  const ExplorePhoneWidgetRS(
      {Key? key,
      required this.url,
      required this.id,
      required this.name,
      required this.avatar,
      required this.likes,
      required this.vues,
      required this.comments})
      : super(key: key);
  @override
  _ExplorePhoneWidgetRSState createState() => _ExplorePhoneWidgetRSState();
}

class _ExplorePhoneWidgetRSState extends State<ExplorePhoneWidgetRS> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          widget.vues.add(FirebaseAuth.instance.currentUser!.uid);
          FirebaseFirestore.instance
              .collection(COLLECTIONS_COLLECTION)
              .doc(widget.id)
              .update({"vues": widget.vues});
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            // color: colorsByDii.white(),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        onDoubleTap: () async {
                          widget.likes
                              .add(FirebaseAuth.instance.currentUser!.uid);
                          FirebaseFirestore.instance
                              .collection(COLLECTIONS_COLLECTION)
                              .doc(widget.id)
                              .update({"likes": widget.likes});
                        },
                        child: VideoPlayer(_controller)),
                  )
                : Container(),
          ),
          Positioned(
              top: size.height * .01,
              child: Container(
                height: size.height * .05,
                width: size.width,
                // color: colorsByDii.honeyYellow(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Container(
                      width: size.width * .35,
                      height: size.height * .05,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Row(
                          children: [
                            Spacer(),
                            CircleAvatar(
                              radius: constraints.maxWidth * .15,
                              backgroundImage: NetworkImage(
                                widget.avatar,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: constraints.maxHeight,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                        color: colorsByDii.white(),
                                        fontSize: constraints.maxWidth * .07,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 2,
                                              offset: Offset(2, 5),
                                              color: colorsByDii.white()),
                                          Shadow(
                                              blurRadius: 2,
                                              offset: Offset(2, 2),
                                              color: colorsByDii.raisinBlack()),
                                        ],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * .1,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color:
                                                  colorsByDii.sizzlingRed())),
                                      child: Text(
                                        '  follow  ',
                                        style: TextStyle(
                                            color: colorsByDii.sizzlingRed(),
                                            fontSize:
                                                constraints.maxWidth * .05),
                                      )),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colorsByDii.sizzlingRed())),
                    ),
                  ],
                ),
              )),
          Positioned(
              right: 10,
              top: size.height * .52,
              child: Container(
                height: size.height * .2,
                width: size.width * .15,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(
                      CupertinoIcons.heart_solid,
                      size: 30,
                      color: colorsByDii.white(),
                    ),
                    Text(
                      '${widget.likes.length}',
                      style: TextStyle(color: colorsByDii.white()),
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.eye,
                      size: 30,
                      color: colorsByDii.white(),
                    ),
                    Text(
                      '${widget.vues.length}',
                      style: TextStyle(color: colorsByDii.white()),
                    ),
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                    color: colorsByDii.eerieBlack(),
                    borderRadius: BorderRadius.circular(size.height * .1)),
              )),
          Positioned(
              bottom: size.height * .08,
              left: size.width * .02,
              child: Container(
                height: size.height * .2,
                width: size.width * .5,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  children: getComments(),
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: size.height * .07,
                width: size.width,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: size.width * .55,
                      height: size.height * .05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: colorsByDii.white()),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Center(
                              child: TextField(
                                cursorColor: colorsByDii.eerieBlack(),
                                // cursorHeight: constraints.maxHeight * .6,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'commentaire',
                                    suffixIcon: Icon(
                                      Icons.send,
                                      // size: constraints.maxWidth * .2,
                                      color: colorsByDii.sizzlingRed(),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * .4,
                      child: LayoutBuilder(
                        builder: (context, constraints) => Row(
                          children: [
                            Spacer(),
                            CircleAvatar(
                              radius: constraints.maxWidth * .12,
                              backgroundColor: colorsByDii.eerieBlack(),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.envelope,
                                  color: colorsByDii.white(),
                                  size: constraints.maxWidth * .15,
                                ),
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: constraints.maxWidth * .12,
                              backgroundColor: colorsByDii.eerieBlack(),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.share,
                                  color: colorsByDii.white(),
                                  size: constraints.maxWidth * .15,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controller.pause();
                                  Navigator.pushNamed(
                                      context, '/rs-collection-add');
                                });
                              },
                              child: CircleAvatar(
                                radius: constraints.maxWidth * .15,
                                backgroundColor: colorsByDii.sizzlingRed(),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.add,
                                    color: colorsByDii.white(),
                                    size: constraints.maxWidth * .15,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ))
        ],
      ),
      // bottomNavigationBar: Container(
      //   width: size.width,
      //   height: size.height * .07,
      //   child: MenuBottomWidgetPhone(screenChoix: 1),
      // ),
    );
  }

  getComments() {
    List<Widget> liste = [];
    for (var item in widget.comments) {
      liste.addAll([
        Container(
          height: size.height * .05,
          width: size.width * .5,
          child: CommentExploreWigdetRS(),
        ),
        SizedBox(
          height: size.height * .02,
        )
      ]);
    }

    return liste;
  }
}
