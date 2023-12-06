import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_source/firebase_options.dart';
import 'package:web_source/pages/home_page.dart';

import 'package:web_source/pages/onboarding.dart';
import 'package:web_source/pages/regstration_first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => OnBoardingPage(),
        "/login": (context) => RegstrationPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
