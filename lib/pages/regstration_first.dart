import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegstrationPage extends StatefulWidget {
  const RegstrationPage({super.key});

  @override
  State<RegstrationPage> createState() => _RegstrationPageState();
}

List<String> items = [
  "Create Account",
  "Login",
];
int current = 0;

class _RegstrationPageState extends State<RegstrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      context: context, builder: (context) => buildSheet());
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
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xff10B981)),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
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
                  ])),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSheet() => Container(
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
          SizedBox(
            height: 70,
            width: 300,
            child: ListView.builder(
                padding: const EdgeInsets.only(right: 20),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState() {
                        current += index;
                      }

                      print(current);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin:
                          const EdgeInsets.only(top: 25, right: 50, left: 20),
                      child: Text(
                        items[index],
                        style: TextStyle(
                            color: current == index
                                ? const Color(0xff32B768)
                                : const Color(0xff89909E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
