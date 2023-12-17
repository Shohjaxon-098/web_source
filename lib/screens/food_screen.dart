import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<String> _itemslocation = [
    "Ambrosia Hotel &\nRestaurant",
    "Handi Restaurant,\nChittagong",
    "Ambrosia Hotel &\nRestaurant"
  ];
  List<String> _itemstitle = [
    "Chicken Biryani",
    "Sauce Tonkatsu ",
    "Chicken Katsu"
  ];
  List<String> _itemsimage = [
    "assets/food1.png",
    "assets/food2.png",
    "assets/food3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
