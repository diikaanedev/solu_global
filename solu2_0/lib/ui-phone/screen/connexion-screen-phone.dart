import 'package:flutter/material.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';

class ConnexionScreenPhone extends StatefulWidget {
  @override
  _ConnexionScreenPhoneState createState() => _ConnexionScreenPhoneState();
}

class _ConnexionScreenPhoneState extends State<ConnexionScreenPhone> {
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
        elevation: .0,
        backgroundColor: cons.rose(),
        toolbarHeight: 0.0,
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
            height: size.height * .5,
            width: size.width,
            color: cons.rose(),
          )),
          Positioned(
              top: size.height * .5,
              child: Container(
                height: size.height * .5,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'KANARAW!',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: cons.maron()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .8,
                      child: Center(
                        child: Text(
                          'email',
                          style: TextStyle(color: cons.gris()),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: cons.blanc(),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      height: size.height * .015,
                    ),
                    Container(
                      height: size.height * .06,
                      width: size.width * .8,
                      child: Center(
                        child: Text(
                          'password',
                          style: TextStyle(color: cons.gris()),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: cons.blanc(),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Container(
                      height: size.height * .05,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'mot de passe oublier ?',
                            style: TextStyle(color: cons.gris()),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          )
                        ],
                      ),
                      // color: cons.gris(),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width * .4,
                      child: Center(
                        child: Text(
                          'Entrer',
                          style: TextStyle(color: cons.blanc()),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: cons.maron(),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      height: size.height * .07,
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            width: size.height * .07,
                            color: cons.maron(),
                          ),
                          Spacer(),
                          Container(
                            width: size.height * .07,
                            color: cons.maron(),
                          ),
                          Spacer(),
                          Container(
                            width: size.height * .07,
                            color: cons.maron(),
                          ),
                          Spacer(),
                        ],
                      ),
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
