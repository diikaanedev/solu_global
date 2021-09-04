import 'dart:convert';

import 'package:flutter/material.dart';

class ColorByDii {
  static Color noir() => Color.fromRGBO(41, 41, 41, 1);
  static Color blanc() => Color.fromRGBO(255, 255, 255, 1);
  static Color gris() => Color.fromRGBO(189, 189, 189, 1);

  static String getMois(int i) {
    switch (i) {
      case 1:
        return 'Janvier';
      case 2:
        return 'Fevrier';
      case 3:
        return 'Mars';
      case 4:
        return 'Avril';
      case 5:
        return 'Mai';
      case 6:
        return 'Juin';
      case 7:
        return 'Julliet';
      case 8:
        return 'Aout';
      case 9:
        return 'Septembre';
      case 10:
        return 'Octobre';
      case 11:
        return 'Novembre';
      case 12:
        return 'Décembre';
      default:
        return 'Erreur Mois';
    }
  }

  static List<String> dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Lundi", "2" : "Mardi", "3" : "Mercredi", "4" : "Jeudi", "5" : "Vendredi", "6" : "Samedi", "7" : "Dimanche" }';

    dynamic monthData =
        '{ "1" : "Janvier", "2" : "Fevrier", "3" : "Mars", "4" : "Avril", "5" : "Mai", "6" : "Juin", "7" : "Julliet", "8" : "Aout", "9" : "Septembre", "10" : "Octobre", "11" : "Novembre", "12" : "Décembre" }';

    // return json.decode(dayData)['${date.weekday}'] +
    //     "-" +
    //     date.day.toString() +
    //     "-" +
    //     json.decode(monthData)['${date.month}'] +
    //     "-" +
    //     date.year.toString();

    return [
      json.decode(monthData)['${date.month}'],
      date.day.toString(),
      date.year.toString(),
      json.decode(dayData)['${date.weekday}'],
    ];
  }
}
