import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_source/pages/map_page.dart';
import 'package:web_source/screens/home_screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Row(
              children: [
                SvgPicture.asset("assets/Frame.svg"),
                GestureDetector(
                  child: Text(
                    "Agrabad 435, Chittagong",
                    style: TextStyle(
                      color: Color(0xff4B5563),
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                ),
              ],
            ),
          ),
          toolbarHeight: h * 0.08,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/Avatar.png"),
                radius: 22,
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        body: HomeScreen());
  }
}
