import 'package:chopper/devices/phone/events/screens/add-event-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/events-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/home-phone-screen.dart';
import 'package:chopper/devices/phone/events/screens/home-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/memories-follow-events-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/memories-for-me-events-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/one-event-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/profile-params-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/profile-screen-phone.dart';
import 'package:chopper/devices/phone/events/screens/profile-tickets-screen-phone.dart';
import 'package:chopper/devices/phone/rs/screens/add-collection-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/add-post-storie-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/discussion-one-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/discussion-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/edit-profile-phone-screen.dart';
import 'package:chopper/devices/phone/rs/screens/explore-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/home-phone-screen-rs.dart';
import 'package:chopper/devices/phone/rs/screens/profile-phone-screen-rs.dart';
import 'package:chopper/devices/phone/solu/screen/home-phone-solou.dart';
import 'package:chopper/get-starting.dart';
import 'package:chopper/utils/colors-by-dii.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ColorsByDii colorsByDii = ColorsByDii();
  @override
  Widget build(BuildContext context) {
    // StatusBar.color(colorsByDii.white());
    return MaterialApp(
      title: 'Chopper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: colorsByDii.eerieBlack(),
          cursorColor: colorsByDii.eerieBlack(),
          accentColor: colorsByDii.eerieBlack()),
      initialRoute: '/',
      routes: {
        '/': (context) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) =>
                  snapshot.hasData ? HomePhoneScreenRS() : GetStarting(),
            ),
        '/rs-explore': (context) => ExplorePhoneScreenRS(),
        '/rs-add-post-stories': (context) => AddPostStoriePhoneScreenRS(),
        '/rs-discussions': (context) => DiscussionPhoneScreenRS(),
        '/rs-collection-add': (context) => addCollectionPhoneScreenRS(),
        '/rs-profile': (context) => ProfilePhoneScreenRS(),
        '/rs-edit-profile': (context) => EditProfilePhoneScreen(),
        '/event-home': (context) => HomeScreenPhoneEVENT(),
        '/events': (context) => EventsScreenPhone(),
        '/profile': (context) => ProfileScreenPhone(),
        '/profile-tickets': (context) => ProfileTicketsScreenPhone(),
        '/profile-params': (context) => ProfileParamsScreenPhone(),
        '/event/one': (context) => OneEventScreenPhone(),
        '/event/add': (context) => AddScreenPhone(),
        '/event/memories/follow': (context) =>
            MemoriesFollowEventsScreenPhone(),
        '/event/memories/for-me': (context) => MemoriesForMeEventsScreenPhone(),
        '/solu-home': (context) => HomePhoneSolu()
      },
    );
  }
}
