import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegstrationPage extends StatefulWidget {
  const RegstrationPage({super.key});

  @override
  State<RegstrationPage> createState() => _RegstrationPageState();
}

class _RegstrationPageState extends State<RegstrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/OrderSuccess.svg",
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Before enjoying Foodmedia services\n                Please register first",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
