import 'package:flutter/material.dart';
import 'package:solu/utils/constant.dart';

class BestProduitListItem extends StatefulWidget {
  final String prix;
  final Color colorBg;
  final String urlTof;

  const BestProduitListItem({Key key, this.prix, this.colorBg, this.urlTof})
      : super(key: key);
  @override
  _BestProduitListItemState createState() => _BestProduitListItemState();
}

class _BestProduitListItemState extends State<BestProduitListItem> {
  Size size;
  bool favorie = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .25,
          width: size.width * .4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.colorBg,
          ),
        ),
        Positioned(
            child: Container(
          height: size.height * .2,
          width: size.width * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image: DecorationImage(image: AssetImage(widget.urlTof))),
        )),
        Positioned(
            bottom: 0,
            child: Container(
                height: size.height * .05,
                width: size.width * .4,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Prix : ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Constant.BLANC()),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${widget.prix} XOF',
                      style: TextStyle(
                          color: Constant.BLANC(),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cinzel'),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Constant.BLUE(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                )
                // color: Constant.BLANC(),
                )),
        Positioned(
            top: 0,
            right: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  favorie = !favorie;
                });
              },
              child: Container(
                height: 30,
                width: 30,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Icon(
                    favorie ? Icons.favorite : Icons.favorite_border,
                    color: Constant.BLANC(),
                    size: 30,
                  ),
                ),
                // color: Constant.ROUGE(),
              ),
            )),
      ],
    );
  }
}
