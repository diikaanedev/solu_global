import 'package:carousel_pro/carousel_pro.dart';
import 'package:chopper/devices/phone/solu/widgets/categories-list-widget-phone-solu.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:chopper/utils/constant-collection-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPhoneSOLU extends StatefulWidget {
  final String id;
  const ShopPhoneSOLU({Key? key, required this.id}) : super(key: key);

  @override
  _ShopPhoneSOLUState createState() => _ShopPhoneSOLUState();
}

class _ShopPhoneSOLUState extends State<ShopPhoneSOLU> {
  ColorsByDii colorsByDii = ColorsByDii();
  late Size size;
  Color color = Colors.white;
  Color colorS = Colors.white;
  String tel = '';

  String nameShop = '';
  String urlShop = '';
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(BOUTIQUES_COLLECTION)
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async => launch("tel:$tel"),
        backgroundColor: colorS,
        child: Icon(
          CupertinoIcons.phone,
          color: color,
        ),
      ),
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
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: size.height * .07,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .02,
                          ),
                          Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth * .15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                image: DecorationImage(
                                    image: NetworkImage(urlShop))),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * .01,
                          ),
                          Text(
                            nameShop,
                            style: TextStyle(
                                fontSize: constraints.maxHeight * .3,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          Spacer(),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: color,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * .02,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: size.height * .35,
                  width: size.width,
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(BOUTIQUES_COLLECTION)
                          .doc(widget.id)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          List d = snapshot.data!.get('promos');

                          getList(BoxConstraints constraints) {
                            List<Widget> l = [];
                            for (var item in d) {
                              l.add(Container(
                                height: constraints.maxHeight * .8,
                                width: constraints.maxWidth * .95,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: constraints.maxHeight * .05,
                                    ),
                                    Container(
                                      height: constraints.maxHeight * .8,
                                      width: constraints.maxWidth * .95,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: constraints.maxWidth * .5,
                                            child: Column(
                                              children: [
                                                Spacer(),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Text(
                                                        "Code Promos : ",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxHeight *
                                                                .05,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: colorsByDii
                                                                .white()),
                                                      ),
                                                      Text(
                                                        "${item['codePromos']}",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxHeight *
                                                                .05,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: colorS),
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      constraints.maxHeight *
                                                          .02,
                                                ),
                                                Text(
                                                  'Méga vente',
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .07,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          colorsByDii.white()),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Spacer(),
                                                      Text(
                                                        'jusqu\'à ',
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxHeight *
                                                                .07,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: colorsByDii
                                                                .white()),
                                                      ),
                                                      Text(
                                                        "${item['pourcentage']}%",
                                                        style: TextStyle(
                                                            fontSize: constraints
                                                                    .maxHeight *
                                                                .07,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: colorS),
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          .12,
                                                  width:
                                                      constraints.maxWidth * .4,
                                                  child: Center(
                                                    child: Text(
                                                      'Acheter Maintenant',
                                                      style: TextStyle(
                                                          color: colorsByDii
                                                              .white(),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: constraints
                                                                  .maxHeight *
                                                              .04),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: colorS,
                                                      borderRadius: BorderRadius
                                                          .circular(constraints
                                                                  .maxWidth *
                                                              .05)),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .03,
                                          ),
                                          Container(
                                            width: constraints.maxWidth * .4,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        item['imagePromos']))),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .02,
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: color,
                                      ),
                                    )
                                  ],
                                ),
                                // color: colorsByDii.sizzlingRed(),
                              ));
                            }
                            return l;
                          }

                          return LayoutBuilder(
                            builder: (context, constraints) => Carousel(
                              dotBgColor: Colors.transparent,
                              dotColor: colorsByDii.sizzlingRed(),
                              dotIncreasedColor: colorsByDii.raisinBlack(),
                              autoplayDuration: Duration(seconds: 15),
                              images: getList(constraints),
                            ),
                          );
                        }
                        return Container();
                      }),
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
                              fontSize: constraints.maxHeight * .3,
                              color: color,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .12,
                  width: size.width,
                  child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(BOUTIQUES_COLLECTION)
                          .doc(widget.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List d = snapshot.data!.get('categories');
                          List<Widget> l = [];
                          for (var item in d) {
                            l.addAll([
                              SizedBox(
                                width: size.width * .02,
                              ),
                              Container(
                                width: size.width * .2,
                                height: size.height * .12,
                                child: CategoriesListWidgetPhoneSOLU(
                                  titre: item['nameCategorie'],
                                  url: item['imageCategorie'],
                                ),
                              )
                            ]);
                          }
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: l,
                          );
                        }
                        return Container();
                      }),
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
                          'Les meilleurs produits du jour',
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .3,
                              color: colorS,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .1,
                  width: size.width,
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(BOUTIQUES_COLLECTION)
                        .doc(widget.id)
                        .snapshots(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        List d = snapshot.data!.get('produitsDay');
                        List<Widget> l = [];
                        for (var item in d) {
                          l.addAll([
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Container(
                              width: size.width * .6,
                              height: size.height * .1,
                              child: LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: colorsByDii.grisCulture(),
                                          borderRadius: BorderRadius.circular(
                                              constraints.maxWidth * .1)),
                                    ),
                                    Positioned(
                                        child: Container(
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth * .4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      constraints.maxWidth *
                                                          .1),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      item['image']),
                                                  fit: BoxFit.cover),
                                            ))),
                                    Positioned(
                                        left: constraints.maxWidth * .42,
                                        child: Container(
                                          width: constraints.maxWidth * .55,
                                          height: constraints.maxHeight,
                                          child: Column(
                                            children: [
                                              Spacer(),
                                              Container(
                                                height:
                                                    constraints.maxHeight * .15,
                                                width:
                                                    constraints.maxWidth * .55,
                                                child: Text(
                                                  item['name'],
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .1),
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Text(
                                                    "${item['price']} FCFA",
                                                    style: TextStyle(
                                                        fontSize: constraints
                                                                .maxHeight *
                                                            .15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        constraints.maxWidth *
                                                            .1,
                                                  ),
                                                  item['pourcentage'] != '0'
                                                      ? Text(
                                                          '-${item['pourcentage']}%',
                                                          style: TextStyle(
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .1,
                                                              color: colorS,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Container(),
                                                  Spacer(),
                                                ],
                                              )),
                                              Spacer(),
                                              Container(
                                                height:
                                                    constraints.maxHeight * .2,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Size : ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: constraints
                                                                  .maxHeight *
                                                              .1),
                                                    ),
                                                    CircleAvatar(
                                                      radius:
                                                          constraints.maxWidth *
                                                              .05,
                                                      backgroundColor: color,
                                                      child: Center(
                                                        child: Text(
                                                          'S',
                                                          style: TextStyle(
                                                              color: colorsByDii
                                                                  .white(),
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .07),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: color,
                                                      radius:
                                                          constraints.maxWidth *
                                                              .05,
                                                      child: Center(
                                                        child: Text(
                                                          'M',
                                                          style: TextStyle(
                                                              color: colorsByDii
                                                                  .white(),
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .07),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: color,
                                                      radius:
                                                          constraints.maxWidth *
                                                              .05,
                                                      child: Center(
                                                        child: Text(
                                                          'L',
                                                          style: TextStyle(
                                                              color: colorsByDii
                                                                  .white(),
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .07),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: color,
                                                      radius:
                                                          constraints.maxWidth *
                                                              .05,
                                                      child: Center(
                                                        child: Text(
                                                          'XL',
                                                          style: TextStyle(
                                                              color: colorsByDii
                                                                  .white(),
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .07),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ]);
                        }
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: l,
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .07,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Container(
                          // width: constraints.maxWidth * .3,
                          height: constraints.maxHeight * .6,
                          decoration: BoxDecoration(
                              border: Border.all(color: color),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * .1)),
                          child: Center(
                            child: Text(
                              '    Nouvelle Arrivage    ',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .2,
                                  color: color,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .35,
                  child: LayoutBuilder(
                    builder: (context, constraints) => StreamBuilder<
                            DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(BOUTIQUES_COLLECTION)
                            .doc(widget.id)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            List d = snapshot.data!.get('produits') as List;
                            List<Widget> l = [];
                            for (var item in d) {
                              if (item['isNew'] == true) {
                                l.addAll([
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth * .5,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) => Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                // color: color,
                                              ),
                                            ),
                                            Positioned(
                                                child: Container(
                                              height:
                                                  constraints.maxHeight * .7,
                                              width: constraints.maxWidth,
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  Container(
                                                    height:
                                                        constraints.maxHeight *
                                                            .6,
                                                    width:
                                                        constraints.maxWidth *
                                                            .8,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              item['image']),
                                                        )),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  // color: colorsByDii.raisinBlack(),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8))),
                                            )),
                                            Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  height:
                                                      constraints.minHeight *
                                                          .3,
                                                  width: constraints.maxWidth *
                                                      .975,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: constraints
                                                                .maxHeight *
                                                            .05,
                                                      ),
                                                      Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            .1,
                                                        width: constraints
                                                                .maxWidth *
                                                            .9,
                                                        child: Text(
                                                          item['name'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            .1,
                                                        child: Row(
                                                          children: [
                                                            Spacer(),
                                                            Text(
                                                              'prix : ',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .03),
                                                            ),
                                                            Text(
                                                              "${item['price']} FCFA",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .04),
                                                            ),
                                                            Spacer(),
                                                            Container(
                                                              height: constraints
                                                                      .maxHeight *
                                                                  .07,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: color),
                                                              child: Center(
                                                                child: Text(
                                                                  '     Ajouter Sac     ',
                                                                  style: TextStyle(
                                                                      color: colorsByDii
                                                                          .white(),
                                                                      fontSize:
                                                                          constraints.maxHeight *
                                                                              .03),
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                          ],
                                                        ),
                                                        // color: colorsByDii
                                                        //     .eerieBlack(),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      // color: color,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                )),
                                            Positioned(
                                                top: 4,
                                                right: 8,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Center(
                                                    child: Icon(
                                                        Icons.favorite_border,
                                                        color: color),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              }
                            }
                            return ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: l,
                            );
                          }
                          return Container();
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .07,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Container(
                          // width: constraints.maxWidth * .3,
                          height: constraints.maxHeight * .6,
                          decoration: BoxDecoration(
                              border: Border.all(color: colorS),
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * .1)),
                          child: Center(
                            child: Text(
                              '    Tendance    ',
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .2,
                                  color: colorS,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * .35,
                  child: LayoutBuilder(
                    builder: (context, constraints) => StreamBuilder<
                            DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(BOUTIQUES_COLLECTION)
                            .doc(widget.id)
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            List d = snapshot.data!.get('produits') as List;
                            List<Widget> l = [];
                            for (var item in d) {
                              if (item['isTendance'] == true) {
                                l.addAll([
                                  SizedBox(
                                    width: constraints.maxWidth * .02,
                                  ),
                                  Container(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth * .5,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) => Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                // color: color,
                                              ),
                                            ),
                                            Positioned(
                                                child: Container(
                                              height:
                                                  constraints.maxHeight * .7,
                                              width: constraints.maxWidth,
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  Container(
                                                    height:
                                                        constraints.maxHeight *
                                                            .6,
                                                    width:
                                                        constraints.maxWidth *
                                                            .8,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              item['image']),
                                                        )),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  // color: colorsByDii.raisinBlack(),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8))),
                                            )),
                                            Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  height:
                                                      constraints.minHeight *
                                                          .3,
                                                  width: constraints.maxWidth *
                                                      .975,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: constraints
                                                                .maxHeight *
                                                            .05,
                                                      ),
                                                      Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            .1,
                                                        width: constraints
                                                                .maxWidth *
                                                            .9,
                                                        child: Text(
                                                          item['name'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: constraints
                                                                      .maxHeight *
                                                                  .03,
                                                              color: colorS,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            .1,
                                                        child: Row(
                                                          children: [
                                                            Spacer(),
                                                            Text(
                                                              'prix : ',
                                                              style: TextStyle(
                                                                  color: colorS,
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .03),
                                                            ),
                                                            Text(
                                                              "${item['price']} FCFA",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: colorS,
                                                                  fontSize:
                                                                      constraints
                                                                              .maxHeight *
                                                                          .04),
                                                            ),
                                                            Spacer(),
                                                            Container(
                                                              height: constraints
                                                                      .maxHeight *
                                                                  .07,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color:
                                                                      colorS),
                                                              child: Center(
                                                                child: Text(
                                                                  '     Ajouter Sac     ',
                                                                  style: TextStyle(
                                                                      color: colorsByDii
                                                                          .white(),
                                                                      fontSize:
                                                                          constraints.maxHeight *
                                                                              .03),
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                          ],
                                                        ),
                                                        // color: colorsByDii
                                                        //     .eerieBlack(),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      // color: color,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                )),
                                            Positioned(
                                                top: 4,
                                                right: 8,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Center(
                                                    child: Icon(
                                                        Icons.favorite_border,
                                                        color: colorS),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              }
                            }
                            return ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: l,
                            );
                          }
                          return Container();
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
