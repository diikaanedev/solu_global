import 'package:flutter/material.dart';
import 'package:solu/model/shop-model.dart';
import 'package:solu/screens/home-four.dart';
import 'package:solu/screens/home-one.dart';
import 'package:solu/screens/home-three.dart';
import 'package:solu/screens/home-two.dart';
import 'package:solu/utils/constant.dart';
import 'package:statusbar/statusbar.dart';

void main() {
  runApp(MyApp());
}

_MyAppState appState;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    appState = _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  List<shopModel> listeShop = [
    shopModel(
        name: 'C\'est carré',
        id: 1,
        colorBg: Constant.ORANGE(),
        urlTofPhare: 'assets/images/polo1.png'),
    shopModel(
        name: 'Jongoma',
        id: 2,
        colorBg: Constant.ROUGE(),
        urlTofPhare: 'assets/images/chemise4.jpg'),
    shopModel(
        colorBg: Constant.BLUE(),
        urlTofPhare: 'assets/images/capuchon.png',
        name: 'Art2Rue',
        id: 3),
    shopModel(
      colorBg: Constant.JAUNE(),
      urlTofPhare: 'assets/images/chemise5.png',
      name: 'MissionnaireBrand',
      id: 4,
    ),
    shopModel(
      colorBg: Constant.VERT(),
      urlTofPhare: 'assets/images/wax.png',
      name: '6point9',
      id: 5,
    ),
  ];
  int screenProfile = 0;
  @override
  void initState() {
    super.initState();
    StatusBar.color(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // color: Constant.ORANGE(),
      theme: ThemeData(fontFamily: 'Lato', primaryColor: Constant.BLANC()),
      home: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(
          initialPage: 0,
        ),
        scrollDirection: Axis.vertical,
        children: [HomeOneScreen(), HomeScreenTwo(), HomeThree(), HomeFour()],
      ),
    );
  }
}
