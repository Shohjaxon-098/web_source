import 'package:flutter/material.dart';
import 'package:web_source/widgets/key.dart';

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
          children: [
            Icon(Icons.location_on_rounded),
            Text(""),
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Container(),
    );
  }
}
