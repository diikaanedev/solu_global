import 'package:event/devices/phone/screen/add-event-screen-phone.dart';
import 'package:event/devices/phone/screen/events-screen-phone.dart';
import 'package:event/devices/phone/screen/home-screen-phone.dart';
import 'package:event/devices/phone/screen/memories-follow-events-screen-phone.dart';
import 'package:event/devices/phone/screen/memories-for-me-events-screen-phone.dart';
import 'package:event/devices/phone/screen/one-event-screen-phone.dart';
import 'package:event/devices/phone/screen/profile-params-screen-phone.dart';
import 'package:event/devices/phone/screen/profile-screen-phone.dart';
import 'package:event/devices/phone/screen/profile-tickets-screen-phone.dart';
import 'package:event/utils/constant-by-dii.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    StatusBar.color(ColorByDii.blanc());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (constext) => HomeScreenPhone(),
        '/events': (context) => EventsScreenPhone(),
        '/profile': (context) => ProfileScreenPhone(),
        '/profile-tickets': (context) => ProfileTicketsScreenPhone(),
        '/profile-params': (context) => ProfileParamsScreenPhone(),
        '/event/one': (context) => OneEventScreenPhone(),
        '/event/add': (context) => AddScreenPhone(),
        '/event/memories/follow': (context) =>
            MemoriesFollowEventsScreenPhone(),
        '/event/memories/for-me': (context) => MemoriesForMeEventsScreenPhone(),
      },
    );
  }
}
