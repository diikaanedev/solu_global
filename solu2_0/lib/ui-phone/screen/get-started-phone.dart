import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/widget/title-slogan-widget.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class GetStartedScreenHome extends StatefulWidget {
  @override
  _GetStartedScreenHomeState createState() => _GetStartedScreenHomeState();
}

class _GetStartedScreenHomeState extends State<GetStartedScreenHome> {
  late ConstantByDii cons;
  late Size size;
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
      auth = FirebaseAuth.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: cons.rose(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: cons.rose().withOpacity(.2),
          ),
          Positioned(
              child: Container(
            height: size.height * .6,
            width: size.width,
            decoration: BoxDecoration(
              color: cons.rose(),
            ),
          )),
          Positioned(
              top: size.height * .05,
              child: Container(
                height: size.height * .2,
                width: size.width,
                child: TitleSloganWidget(),
              )),
          Positioned(
              top: size.height * .6,
              child: Container(
                height: size.height * .4,
                width: size.width,
                child: Column(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/connexion');
                      },
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .8,
                        child: Center(
                          child: Text(
                            'SE CONNECTER',
                            style: TextStyle(color: cons.blanc()),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: cons.maron(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    GestureDetector(
                      onTap: () async {
                        UserCredential user = await auth.signInAnonymously();
                        print('user.user!.uid => ${user.user!.uid}');
                      },
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .8,
                        child: Center(
                          child: Text(
                            'ENTRER',
                            style: TextStyle(color: cons.maron()),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: cons.maron())),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      height: size.height * .05,
                      child: Center(
                        child: Text(
                          'incrivez-vous ?',
                          style: TextStyle(color: cons.gris()),
                        ),
                      ),
                      // color: cons.rose(),
                    ),
                    Spacer(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
