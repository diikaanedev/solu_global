import 'package:flutter/material.dart';
import 'package:solu/main.dart';
import 'package:solu/widgets/mark-widget-home.dart';

List<Widget> listeMarkHome() {
  List<Widget> listes = [];

  for (var item in appState.listeShop) {
    listes.add(MarkWidgetHome(
      shop: item,
    ));
  }

  return listes;
}
