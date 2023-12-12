import 'package:flutter/material.dart';
import 'package:web_source/pages/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_rounded),
            GestureDetector(
              child: Text("Navoiy"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapPage()));
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      body: Container(),
    );
  }
}
