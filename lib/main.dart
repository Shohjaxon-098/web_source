
import 'package:web_source/utils/tools/file_importants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyA6-YVEWzkPwCEYvvxI1HysddcLEjocZQk',
      appId: '1:445638539890:android:2a974f11b211aa39e8a0eb',
      messagingSenderId: '445638539890',
      projectId: 'authenticationwith-1420f',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => OnBoardingPage(),
        "/home": (context) => HomePage(),
        "/map": (context) => MapPage(),
        "/food": (context) => FoodScreen(),
        "/history": (context) => HistoryPage(),
      },
    );
  }
}
