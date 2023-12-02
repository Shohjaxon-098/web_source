import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:web_source/pages/home_page.dart';
import 'package:web_source/pages/regstration_first.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RegstrationPage()),
    );
  }

  Widget _buildImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 12.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,

      infiniteAutoScroll: false,

      pages: [
        PageViewModel(
          title: "Nearby restaurants",
          body:
              "You don't have to go far to find a good restaurant,we have provided all the restaurants that is near you",
          image: _buildImage('Maps.svg', 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Select the Favorites Menu",
          body:
              "Now eat well, don't leave the house,You can choose your favorite food only with one click",
          image: _buildImage('Order.svg', 260),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Good food at a cheap price",
          body: "You can eat at expensive restaurants with\nnffordable price",
          image: _buildImage('SafeFood.svg', 260),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      animationDuration: 400,
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,

      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
      ),
      skip: const Text('Skip', style: TextStyle(color: Color(0xff4B5563))),
      next: const Icon(
        Icons.arrow_forward,
        color: Color(0xFF32B768),
      ),
      done: const Icon(
        Icons.arrow_forward,
        color: Color(0xFF32B768),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFE6E6E6),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFF32B768),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
