import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_source/pages/create_account.dart';
import 'package:web_source/pages/login.dart';

class RegstrationPage extends StatefulWidget {
  const RegstrationPage({super.key});

  @override
  State<RegstrationPage> createState() => _RegstrationPageState();
}

class _RegstrationPageState extends State<RegstrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/OrderSuccess.svg",
                ),
                const SizedBox(
                  height: 55,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Before enjoying Foodmedia services\n                Please register first",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 95,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xff32B768),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          scrollControlDisabledMaxHeightRatio: 0.76,
                          context: context,
                          builder: (context) => const BuildBottomSheet());
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        elevation: const MaterialStatePropertyAll(0),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color(0xffD1FAE5),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff10B981)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "By Logging In Or Registering, You Have Agreed To "),
                        TextSpan(
                            text:
                                "The Terms And\n                                Conditions ",
                            style: TextStyle(color: Color(0xff32B768))),
                        TextSpan(text: "And "),
                        TextSpan(
                            text: "Privacy Policy.",
                            style: TextStyle(color: Color(0xff32B768))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet({super.key});

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 23),
              width: 48,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD2D4D8),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: TabBar(
                physics: ClampingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                indicatorColor: Color(0xff32B768),
                unselectedLabelColor: Color(0xff89909E),
                labelColor: Color(0xff32B768),
                tabs: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: TabBarView(
                children: [SignInForm(), LoginPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
