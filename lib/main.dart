import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_source/pages/home_page.dart';

import 'package:web_source/pages/onboarding.dart';
import 'package:web_source/pages/regstration_first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyDL2tX_HCIQeTNBb6ekCYAiLLDhXE7QOOw',
        appId: '1:445638539890:web:864a0df96584692ee8a0eb',
        messagingSenderId: '445638539890',
        projectId: 'authenticationwith-1420f',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
