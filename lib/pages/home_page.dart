

import 'package:web_source/utils/tools/file_importants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            HomeScreen(),
            HistoryPage(),
            AccountPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/homeEnable.svg"),
              icon: SvgPicture.asset("assets/homeDisable.svg"),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/historyEnable.svg"),
              icon: SvgPicture.asset("assets/historyDisable.svg"),
              label: ""),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/accountEnable.svg"),
              icon: SvgPicture.asset("assets/accountDisable.svg"),
              label: ""),
        ],
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
