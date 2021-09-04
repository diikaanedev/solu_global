import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MarkPhoneSOLU2 extends StatefulWidget {
  final String id;
  final String genre;
  const MarkPhoneSOLU2({Key? key, required this.id, required this.genre})
      : super(key: key);

  @override
  _MarkPhoneSOLU2State createState() => _MarkPhoneSOLU2State();
}

class _MarkPhoneSOLU2State extends State<MarkPhoneSOLU2> {
  late Size size;
  ColorsByDii colorsByDii = ColorsByDii();
  Color color = Colors.white;
  Color colorS = Colors.white;
  String nameShop = '';
  String urlShop = '';
  String tel = '';
  String imgCol = '';

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(MARQUES_COLLECTION)
        .doc(widget.id)
        .get()
        .then((value) {
      String i = value.get('color');
      String j = value.get('colorSecondaire');
      setState(() {
        color = Color.fromRGBO(int.parse(i.split(',')[0]),
            int.parse(i.split(',')[1]), int.parse(i.split(',')[2]), 1);
        colorS = Color.fromRGBO(int.parse(j.split(',')[0]),
            int.parse(j.split(',')[1]), int.parse(j.split(',')[2]), 1);
        nameShop = value.get('name');
        urlShop = value.get('urlLogo');
        tel = value.get('telephone');
      });
    });
    FirebaseFirestore.instance
        .collection(MARQUES_COLLECTION)
        .doc(widget.id)
        .collection('collections')
        .get()
        .then((value) => print(value.docs.last.get('image')));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
        backgroundColor: colorsByDii.white(),
      ),
      backgroundColor: colorsByDii.white(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                Container(
                  height: size.height * .6,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(MARQUES_COLLECTION)
                        .doc(widget.id)
                        .collection('collections')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return LayoutBuilder(
                            builder: (context, constraints) => Stack(
                                  children: [
                                    Container(
                                      height: constraints.maxHeight,
                                      width: constraints.maxWidth,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data!.docs.last
                                                  .get('image')),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                        bottom: constraints.maxHeight * .1,
                                        left: constraints.maxWidth * .02,
                                        child: Text(
                                            "${snapshot.data!.docs.last.get('name')} collections",
                                            style: TextStyle(
                                                color: colorsByDii.white(),
                                                fontSize:
                                                    constraints.maxHeight * .06,
                                                fontWeight: FontWeight.bold))),
                                    Positioned(
                                        bottom: constraints.maxHeight * .05,
                                        left: constraints.maxWidth * .02,
                                        child: Row(
                                          children: [
                                            Text("Découvrir",
                                                style: TextStyle(
                                                  color: colorsByDii.white(),
                                                  fontSize:
                                                      constraints.maxHeight *
                                                          .04,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Icon(
                                                Icons.forward,
                                                color: colorsByDii.white(),
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ));
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .05,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Text(
                          'Catégories',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .4,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .3,
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(MARQUES_COLLECTION)
                        .doc(widget.id)
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return LayoutBuilder(builder: (context, constraints) {
                          return ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data!
                                .get('categories')
                                .map<Widget>((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * .5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        constraints.maxWidth *
                                                            .02),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        e['image']),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Positioned(
                                              bottom:
                                                  constraints.maxHeight * .02,
                                              left: constraints.maxWidth * .02,
                                              child: Container(
                                                height:
                                                    constraints.maxHeight * .1,
                                                width:
                                                    constraints.maxWidth * .6,
                                                child: Text(
                                                  e['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          colorsByDii.white(),
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .05),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ))
                                .toList(),
                          );
                        });
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .05,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Text(
                          'Nos dernières artices',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .4,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .4,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(MARQUES_COLLECTION)
                          .doc(widget.id)
                          .collection('collections')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> l = [];
                          snapshot.data!.docs.forEach((element) {
                            List d = element.get('produits');

                            l.addAll(d
                                .map((e) => Container(
                                      height: size.height * .4,
                                      width: size.width * .6,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) =>
                                            Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: constraints.maxHeight,
                                                width: constraints.maxWidth,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            constraints
                                                                    .maxHeight *
                                                                .02),
                                                    color: color),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList());
                          });
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: size.width * .02),
                            physics: BouncingScrollPhysics(),
                            children: l,
                          );
                        }
                        return Container();
                      }),
                )
              ],
              physics: BouncingScrollPhysics(),
            ),
          ))
        ],
      ),
    );
  }
}
