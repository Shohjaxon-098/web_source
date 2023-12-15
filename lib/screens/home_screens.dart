import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:web_source/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: w * 0.75,
              height: h * 0.044,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffE6E7E9),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: TextFormField(
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(left: 27),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Color(0xff9CA3AF),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Color(
                          0xff9CA3AF,
                        ),
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            Container(
              height: h * 0.26,
              child: FlutterCarousel(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 375.0,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(
                    itemSpacing: 15,
                    currentIndicatorColor: Color(0xff32B768),
                    indicatorBackgroundColor: Color(0xffE2E2E2),
                  ),
                ),
                items: [
                  "assets/image1.png",
                  "assets/image2.png",
                  "assets/image1.png",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(i));
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 18),
              width: double.infinity,
              height: h * 0.33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today New Arivable",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Best of the today  food list update",
                              style: TextStyle(color: Color(0xff6B7280)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 17),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "See All >",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff6B7280)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  RecipeCard(
                      title: "Chicken Biryani",
                      location: "Navoi",
                      image: "assets/food1.png"),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.green,
            )),
          ],
        ),
      ),
    );
  }
}
