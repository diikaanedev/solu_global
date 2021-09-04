import 'package:flutter/material.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/utils/constant.dart';

class TopNavProfile extends StatefulWidget {
  final int screen;
  final String titrePage;

  const TopNavProfile({Key key, this.screen, this.titrePage}) : super(key: key);
  @override
  _TopNavProfileState createState() => _TopNavProfileState();
}

class _TopNavProfileState extends State<TopNavProfile> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .1,
          ),
          GestureDetector(
            onTap: () {
              homeFourState.setState(() {
                homeFourState.screen = widget.screen;
              });
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 20.0,
            ),
          ),
          Spacer(),
          Text(
            widget.titrePage,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Constant.BLUE()),
          ),
          Spacer(),
          Icon(
            Icons.more_vert_outlined,
            size: 24.0,
          ),
          SizedBox(
            width: size.width * .05,
          ),
        ],
      ),
    );
  }
}
