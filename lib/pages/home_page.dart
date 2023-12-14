import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_source/pages/map_page.dart';
import 'package:web_source/widgets/form_container_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
      body: Expanded(
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
                height: h * 0.3,
                color: Colors.yellow,
              ),
              Expanded(
                  child: Container(
                color: Colors.green,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
