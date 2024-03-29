import 'package:flutter/cupertino.dart';
import 'package:web_source/utils/tools/file_importants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _itemsHotelimage = [
    "assets/hotel1.png",
    "assets/hotel2.png",
    "assets/hotel1.png",
  ];
  List<String> _itemsHotelBook = ["Book", "Book", "Book"];
  List<String> _itemsHoteltitle = [
    "Ambrosia Hotel & Restaurant",
    "Tava Restaurant",
    "Haatkhola"
  ];
  List<String> _itemsHotellocation = [
    "kazi Deiry, Taiger Pass\nChittagong",
    "Zakir Hossain Rd,\nChittagong",
    "6 Surson Road,\nChittagong"
  ];

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
  Future<void> _onRefresh() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Row(
            children: [
              SvgPicture.asset("assets/location.svg"),
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
        toolbarHeight: h(context) * 0.08,
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
      body: Container(
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Column(
              children: [
                SizedBox(
                  width: w(context) * 0.75,
                  height: h(context) * 0.044,
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
                  height: h(context) * 0.26,
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
                  height: h(context) * 0.37,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                onTap: () {
                                  Navigator.pushNamed(context, "/food");
                                },
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            _itemsimage.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: RecipeCard(
                                  c1w: w(context) * 0.4,
                                  c1h: h(context) * 0.25,
                                  c2w: w(context) * 0.35,
                                  c2h: h(context) * 0.25,
                                  title: _itemstitle[index],
                                  location: _itemslocation[index],
                                  image: _itemsimage[index]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Column(
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
                                  "Booking Restaurant",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Check your city Near by Restaurant",
                                  style: TextStyle(color: Color(0xff6B7280)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/hotel");
                                },
                                child: Text(
                                  "See All >",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff6B7280)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: List.generate(
                            _itemsHotelimage.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 6, right: 17),
                              child: HotelCard(
                                  titleButton: _itemsHotelBook[index],
                                  title: _itemsHoteltitle[index],
                                  location: _itemsHotellocation[index],
                                  image: _itemsHotelimage[index],
                                  c1w: 400,
                                  c1h: 88,
                                  c2w: double.infinity,
                                  c2h: 64),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
