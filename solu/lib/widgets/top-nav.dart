import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class TopNav extends StatefulWidget {
  final int type;

  const TopNav({Key key, this.type = 1}) : super(key: key);
  @override
  _TopNavState createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  Size size;
  bool showHome = true;
  bool showFavorie = false;
  bool showBag = false;
  bool showProfile = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .05,
          ),
          Text(
            'Solu2.0',
            style: TextStyle(
                fontFamily: 'Satisfy', fontSize: 35, color: Constant.BLUE()),
          ),
          Spacer(),
          Container(
            height: size.height * .04,
            child: Center(
              child: Text(
                widget.type == 1 ? '  Tendance  ' : '  #TopHastag  ',
                style: TextStyle(
                    fontSize: 20,
                    color: Constant.BLANC(),
                    fontWeight: FontWeight.w900),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Constant.BLUE()),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert_outlined,
            color: Constant.BLUE(),
            size: 20,
          ),
          SizedBox(
            width: size.width * .05,
          ),
        ],
      ),
    );
  }
}


// widget.type == 2
          //     ?
          // Container(
          //     height: size.height * .07,
          //     width: size.width * .64,
          //     decoration: BoxDecoration(
          //         color: Constant.BLUE(),
          //         borderRadius: BorderRadius.circular(2)),
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           height: size.height * .01,
          //         ),
          //         Container(
          //           height: size.height * .05,
          //           width: size.width * .64,

          //           // color: Constant.BLUE(),
          //           child: Row(
          //             children: [
          //               // Spacer(),
          //               Container(
          //                 height: size.height * .04,
          //                 width: size.width * .64,
          //                 child: Row(
          //                   children: [
          //                     Spacer(),
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           showBag = false;
          //                           showProfile = false;
          //                           showFavorie = false;
          //                           showHome = true;
          //                         });
          //                       },
          //                       child: Container(
          //                         height: size.height * .04,
          //                         decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.circular(10),
          //                             color: showHome
          //                                 ? Constant.ORANGE()
          //                                 : Colors.transparent),
          //                         child: Row(
          //                           children: [
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Icon(
          //                               Icons.home_filled,
          //                               color: showHome
          //                                   ? Constant.BLUE()
          //                                   : Constant.BLANC(),
          //                               size: 20,
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             if (showHome)
          //                               Text(
          //                                 'Home',
          //                                 style: TextStyle(
          //                                     fontSize: 14,
          //                                     color: Constant.BLUE(),
          //                                     fontWeight: FontWeight.w900),
          //                               ),
          //                             if (showHome)
          //                               SizedBox(
          //                                 width: 5,
          //                               ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     Spacer(),
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           showHome = false;
          //                           showBag = false;
          //                           showProfile = false;
          //                           showFavorie = true;
          //                         });
          //                       },
          //                       child: Container(
          //                         height: size.height * .04,
          //                         decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.circular(10),
          //                             color: showFavorie
          //                                 ? Constant.ORANGE()
          //                                 : Colors.transparent),
          //                         child: Row(
          //                           children: [
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Icon(
          //                               Icons.favorite,
          //                               color: showFavorie
          //                                   ? Constant.BLUE()
          //                                   : Constant.BLANC(),
          //                               size: 20,
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             if (showFavorie)
          //                               Text(
          //                                 ' Favorie ',
          //                                 style: TextStyle(
          //                                     fontSize: 14,
          //                                     color: Constant.BLUE(),
          //                                     fontWeight: FontWeight.w900),
          //                               ),
          //                             if (showFavorie)
          //                               SizedBox(
          //                                 width: 5,
          //                               ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     Spacer(),
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           showHome = false;
          //                           showProfile = false;
          //                           showFavorie = false;
          //                           showBag = true;
          //                         });
          //                       },
          //                       child: Container(
          //                         height: size.height * .04,
          //                         decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.circular(10),
          //                             color: showBag
          //                                 ? Constant.ORANGE()
          //                                 : Colors.transparent),
          //                         child: Row(
          //                           children: [
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Icon(
          //                               Icons.shopping_bag_rounded,
          //                               color: showBag
          //                                   ? Constant.BLUE()
          //                                   : Constant.BLANC(),
          //                               size: 20,
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             if (showBag)
          //                               Text(
          //                                 ' Cart ',
          //                                 style: TextStyle(
          //                                     fontSize: 14,
          //                                     color: Constant.BLUE(),
          //                                     fontWeight: FontWeight.w900),
          //                               ),
          //                             if (showBag)
          //                               SizedBox(
          //                                 width: 5,
          //                               ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     Spacer(),
          //                     GestureDetector(
          //                       onTap: () {
          //                         setState(() {
          //                           showHome = false;
          //                           showFavorie = false;
          //                           showBag = false;
          //                           showProfile = true;
          //                         });
          //                       },
          //                       child: Container(
          //                         height: size.height * .04,
          //                         decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.circular(10),
          //                             color: showProfile
          //                                 ? Constant.ORANGE()
          //                                 : Colors.transparent),
          //                         child: Row(
          //                           children: [
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Icon(
          //                               Icons.person_outline_outlined,
          //                               color: showProfile
          //                                   ? Constant.BLUE()
          //                                   : Constant.BLANC(),
          //                               size: 20,
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             if (showProfile)
          //                               Text(
          //                                 ' Profile ',
          //                                 style: TextStyle(
          //                                     fontSize: 14,
          //                                     color: Constant.BLUE(),
          //                                     fontWeight: FontWeight.w900),
          //                               ),
          //                             if (showProfile)
          //                               SizedBox(
          //                                 width: 5,
          //                               ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                     Spacer(),
          //                   ],
          //                 ),
          //                 decoration: BoxDecoration(
          //                     // borderRadius: BorderRadius.circular(10),
          //                     // color: Constant.BLUE()
          //                     ),
          //               ),
          //               Spacer(),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   )
          // : Container(),