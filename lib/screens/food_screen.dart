import 'package:web_source/utils/tools/file_importants.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: _itemsimage.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              mainAxisExtent: 250,
              crossAxisSpacing: 15),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RecipeCard(
                title: _itemstitle[index],
                location: _itemslocation[index],
                image: _itemsimage[index],
                c1w: w(context) * 0.4,
                c1h: h(context) * 0.25,
                c2w: w(context) * 0.45,
                c2h: h(context) * 0.25,
              ),
            );
          }),
    );
  }
}
