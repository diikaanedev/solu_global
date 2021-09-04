import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List uniqifyList(List<QueryDocumentSnapshot<Object?>> list) {
  List l = [];
  for (int i = 0; i < list.length; i++) {
    QueryDocumentSnapshot o = list[i];
    int index;
    // Remove duplicates
    do {
      index = list
          .sublist(i + 1)
          .indexWhere((element) => element.get('idUser') == o.get('idUser'));
      if (index != -1) {
        l.add(o.get('image'));
        list.removeRange(index, 1);
      }
    } while (index != -1);
  }
  return l;
}

String readTimestamp(Duration diff) {
  var time = '';

  // print(diff.inDays);

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }

  return time;
}

String getMois(int i) {
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

List<String> dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Lundi", "2" : "Mardi", "3" : "Mercredi", "4" : "Jeudi", "5" : "Vendredi", "6" : "Samedi", "7" : "Dimanche" }';

  dynamic monthData =
      '{ "1" : "Janvier", "2" : "Fevrier", "3" : "Mars", "4" : "Avril", "5" : "Mai", "6" : "Juin", "7" : "Julliet", "8" : "Aout", "9" : "Septembre", "10" : "Octobre", "11" : "Novembre", "12" : "Décembre" }';

  return [
    json.decode(monthData)['${date.month}'],
    date.day.toString(),
    date.year.toString(),
    json.decode(dayData)['${date.weekday}'],
  ];
}
