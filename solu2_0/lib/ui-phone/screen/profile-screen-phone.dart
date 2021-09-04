import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/home-button-nav-bar-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class ProfileScreenPhone extends StatefulWidget {
  @override
  _ProfileScreenPhoneState createState() => _ProfileScreenPhoneState();
}

class _ProfileScreenPhoneState extends State<ProfileScreenPhone> {
  late ConstantByDii cons;
  late Size size;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: cons.blanc(),
          ),
          Positioned(
              child: Container(
            height: size.height * .3,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Balaclava_3_hole_black.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          )),
          Positioned(
              top: size.height * .25,
              left: size.width * .4,
              child: Container(
                height: size.height * .1,
                width: size.height * .1,
                decoration: BoxDecoration(
                    color: cons.noir(),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/9/9a/Balaclava_3_hole_black.jpg',
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(size.height)),
              )),
          Positioned(
              top: size.height * .35,
              child: Container(
                height: size.height * .15,
                width: size.width,
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      'Seydina Issa Laye Kane',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: cons.noir()),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('diikaanedev'),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'LifeStyle,photographie,ux/ui,design,develloper',
                      style: TextStyle(color: cons.gris()),
                    ),
                    Spacer()
                  ],
                ),
              )),
          Positioned(
              top: size.height * .48,
              child: Container(
                height: size.height * .1,
                width: size.width,
                color: cons.maron(),
              )),
          Positioned(
              child: Container(
            width: size.width,
            height: size.height * .05,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                )
              ],
            ),
          )),
          Positioned(
              bottom: size.height * .02,
              left: size.width * .1,
              child: Container(
                height: size.height * .05,
                width: size.width * .8,
                child: HomeButtonNavBarWidget(
                  intChoix: 4,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cons.noir(),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: cons.grisFonce())
                    ]),
              ))
        ],
      ),
    );
  }
}
