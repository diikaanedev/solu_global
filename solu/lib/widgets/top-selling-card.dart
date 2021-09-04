import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class TopSellingCard extends StatefulWidget {
  final String name, prix, urlRouge, urlBleu, urlVert, urlJaune, urlMaron;
  final bool isShoes;

  const TopSellingCard({
    Key key,
    this.name,
    this.prix,
    this.isShoes = false,
    this.urlRouge,
    this.urlBleu,
    this.urlVert,
    this.urlJaune,
    this.urlMaron,
  }) : super(key: key);
  @override
  _TopSellingCardState createState() => _TopSellingCardState();
}

class _TopSellingCardState extends State<TopSellingCard> {
  Size size;
  bool isAddFavori = false;
  String dropdownValue = '1';
  int choixColor = 1;
  int sizeChoice = 1;
  int quantityChoice = 1;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .65,
          width: size.width * .85,
          // color: Constant.VERT(),
        ),
        Positioned(
            left: size.width * .025,
            // top: size.height * .025,
            child: Card(
              color: Constant.BLANC(),
              shadowColor: Constant.GRIS(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 2,
              child: Container(
                height: size.height * .64,
                width: size.width * .8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .27,
                      width: size.width * .6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // color: Constant.ORANGE(),
                          image: DecorationImage(
                            image: AssetImage(choixColor == 1
                                ? widget.urlRouge
                                : choixColor == 2
                                    ? widget.urlBleu
                                    : choixColor == 3
                                        ? widget.urlVert
                                        : choixColor == 4
                                            ? widget.urlJaune
                                            : widget.urlMaron),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .05,
                      // width: size.width * .65,
                      // color: Constant.ROUGE(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${widget.name}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Constant.BLUE()),
                          ),
                          Spacer(),
                          Text(
                            '${widget.prix} XOF',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Constant.ORANGE()),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: size.height * .05,
                      // width: size.width * .65,
                      // color: Constant.BEIGE(),
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .23,
                            // color: Constant.BEIGE(),
                            child: Text(
                              'Couleur',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Constant.BLUE()),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                choixColor = 1;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                child: choixColor == 1
                                    ? Icon(
                                        Icons.check,
                                        color: Constant.BLANC(),
                                      )
                                    : Container(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constant.ROUGE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                choixColor = 2;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                child: choixColor == 2
                                    ? Icon(
                                        Icons.check,
                                        color: Constant.BLANC(),
                                      )
                                    : Container(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                choixColor = 3;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                child: choixColor == 3
                                    ? Icon(
                                        Icons.check,
                                        color: Constant.BLANC(),
                                      )
                                    : Container(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constant.VERT(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                choixColor = 4;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                child: choixColor == 4
                                    ? Icon(
                                        Icons.check,
                                        color: Constant.BLANC(),
                                      )
                                    : Container(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constant.ORANGE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                choixColor = 5;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                child: choixColor == 5
                                    ? Icon(
                                        Icons.check,
                                        color: Constant.BLANC(),
                                      )
                                    : Container(),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constant.MARON_DUR(),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    // Container(
                    //   height: .5,
                    //   width: size.width * .4,
                    //   color: Constant.BLUE(),
                    // ),
                    Container(
                      height: size.height * .05,
                      // width: size.width * .65,
                      // color: Constant.BEIGE(),
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .23,
                            // color: Constant.BEIGE(),
                            child: Text(
                              'Taille',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Constant.BLUE()),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeChoice = 1;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                widget.isShoes ? '30' : 'M',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sizeChoice == 1
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeChoice = 2;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                widget.isShoes ? '35' : 'S',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sizeChoice == 2
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeChoice = 3;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                widget.isShoes ? '40' : 'X',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sizeChoice == 3
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeChoice = 4;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                widget.isShoes ? '43' : 'XL',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sizeChoice == 4
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeChoice = 5;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                widget.isShoes ? '45' : 'XXL',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sizeChoice == 5
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: size.height * .05,
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .23,
                            // color: Constant.BEIGE(),
                            child: Text(
                              'Quantité',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Constant.BLUE()),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantityChoice = 1;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: quantityChoice == 1
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantityChoice = 2;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                '2',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: quantityChoice == 2
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantityChoice = 3;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                '3',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: quantityChoice == 3
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantityChoice = 4;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                '4',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: quantityChoice == 4
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantityChoice = 5;
                              });
                            },
                            child: Container(
                              height: size.height * .03,
                              width: size.height * .03,
                              child: Center(
                                  child: Text(
                                '+',
                                style: TextStyle(
                                    color: Constant.BLANC(), fontSize: 10),
                              )),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: quantityChoice == 5
                                    ? Constant.ORANGE()
                                    : Constant.BLUE(),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .05,
                      // color: Constant.BEIGE(),
                      child: Row(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .23,
                            // color: Constant.BEIGE(),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Constant.BLUE()),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: size.height * .05,
                            width: size.width * .5,
                            child: Center(
                                child: Text(
                              '100% coton , trés léger, disponible sur toutes les couleurs ...',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: Constant.BLUE(),
                              ),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: Constant.ROUGE(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: size.height * .05,
                      child: Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAddFavori = !isAddFavori;
                              });
                            },
                            child: Container(
                              height: size.height * .05,
                              width: size.width * .1,
                              child: Center(
                                child: Container(
                                  height: size.height * .05,
                                  width: size.height * .05,
                                  decoration: BoxDecoration(
                                      color: Constant.BLUE(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Icon(
                                      isAddFavori
                                          ? Icons.favorite_outlined
                                          : Icons.favorite_border_outlined,
                                      color: Constant.BLANC(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                              height: size.height * .05,
                              width: size.width * .6,
                              child: Center(
                                child: Text(
                                  'Add to Bag',
                                  style: TextStyle(
                                      fontFamily: 'Cinzel',
                                      color: Constant.BLANC(),
                                      fontSize: 20),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Constant.BLUE(),
                                  borderRadius: BorderRadius.circular(5))),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Constant.BLANC(),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )),
        // Positioned(
        //     top: 8,
        //     right: 8,
        //     child: Card(
        //       // color: Constant.VERT(),
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50)),
        //       elevation: 2,
        //       child: Container(
        //         height: 30,
        //         width: 30,
        //         child: Center(
        //             child: DropdownButton<String>(
        //           dropdownColor: Constant.BLUE(),
        //           value: dropdownValue,
        //           icon: Container(),
        //           iconSize: 0,
        //           elevation: 2,
        //           // style: const TextStyle(color: Colors.black),
        //           underline: Container(),
        //           onChanged: (String newValue) {
        //             setState(() {
        //               dropdownValue = newValue;
        //             });
        //           },
        //           items: <String>[
        //             '1',
        //             '2',
        //             '3',
        //             '4',
        //             '5',
        //             '6',
        //             '7',
        //             '8',
        //             '9',
        //           ].map<DropdownMenuItem<String>>((String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Center(
        //                 child: Text(
        //                   value,
        //                   style: TextStyle(color: Constant.BLANC()),
        //                 ),
        //               ),
        //             );
        //           }).toList(),
        //         )),
        //         decoration: BoxDecoration(
        //             color: Constant.BLUE(),
        //             borderRadius: BorderRadius.circular(50)),
        //       ),
        //     )),
      ],
    );
  }
}
