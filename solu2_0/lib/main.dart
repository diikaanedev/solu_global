import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solu2_0/ui-phone/screen/add-event-screen-phone.dart';
import 'package:solu2_0/ui-phone/screen/connexion-screen-phone.dart';
import 'package:solu2_0/ui-phone/screen/get-started-phone.dart';
import 'package:solu2_0/ui-phone/screen/home-screen-phone.dart';
import 'package:solu2_0/ui-phone/screen/message-screen-phone.dart';
import 'package:solu2_0/ui-phone/screen/profile-screen-phone.dart';
import 'package:solu2_0/ui-phone/screen/search-screen-phone.dart';
import 'package:solu2_0/utils/constant-by-dii.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:statusbar/statusbar.dart' show StatusBar;

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
  late ConstantByDii cons;

  @override
  void initState() {
    super.initState();
    setState(() {
      cons = ConstantByDii();
    });
    StatusBar.color(cons.blanc());
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Rufina', backgroundColor: cons.blanc()),
        initialRoute: '/',
        routes: {
          '/': (context) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return GetStartedScreenHome();
                }
                return HomeScreenPhone();
              }),
          '/connexion': (context) => ConnexionScreenPhone(),
          '/search': (context) => SearchScreenPhone(),
          '/profile': (context) => ProfileScreenPhone(),
          '/add-event': (context) => AddEventScreenPhone(),
          '/message': (context) => MessageScreenPhone()
        },
      );
}
