import 'package:flutter/material.dart';
import 'package:solu/main.dart';
import 'package:solu/widgets/best-shop-list-item.dart';

List<Widget> listeBestShop() {
  List<Widget> listes = [];
  listes.add(SizedBox(
    width: 20,
  ));
  for (var item in appState.listeShop) {
    listes.add(BestShopListItem(
      shop: item,
    ));
    listes.add(SizedBox(
      width: 20,
    ));
  }

  return listes;
}
