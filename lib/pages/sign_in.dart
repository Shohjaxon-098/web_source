import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'package:web_source/pages/home_page.dart';
import 'package:web_source/widgets/key.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void singIn(BuildContext context) {
    // confetti.fire();
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (formKey.currentState!.validate()) {
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              // Navigate & hide confetti
              Future.delayed(const Duration(seconds: 1), () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              reset.fire();
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Full Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff374151),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 28, bottom: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.063,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your full name",
                      hintStyle:
                          TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: const Text(
                  "Email address ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff374151),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 28, bottom: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.063,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Ex: nameusername@gmail.com",
                      hintStyle:
                          TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff374151),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 28, bottom: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.063,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "**** **** ****",
                      hintStyle:
                          TextStyle(color: Color(0xff9CA3AF), fontSize: 12),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.061,
                  child: ElevatedButton(
                    child: Text(
                      "Registration",
                      style: TextStyle(
                        color: Color(0xff9CA3AF),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      });
                    },
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0.7),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffE5E5E5)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 3),
                child: Divider(),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.061,
                  child: ElevatedButton(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/ic_google.svg"),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Sign up with Google",
                          style: TextStyle(
                            color: Color(0xff222222),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      singIn(context);
                    },
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0.5),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffF4F4F4)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
