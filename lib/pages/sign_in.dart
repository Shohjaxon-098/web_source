import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:web_source/pages/home_page.dart';
import 'package:web_source/services/auth_service.dart';
import 'package:web_source/widgets/form_container_widget.dart';
import 'package:web_source/widgets/key.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isSigning = false;
  final FireBaseAuthService _fireBaseAuthService = FireBaseAuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                  child: FormContainerWidget(
                    hintText: "Enter your full name",
                    isPasswordField: false,
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
                  child: FormContainerWidget(
                    hintText: "Ex: nameusername@email.com",
                    isPasswordField: false,
                    controller: _emailController,
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
                  child: FormContainerWidget(
                    hintText: "**** **** ****",
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
                    child: Center(
                      child:_isSigning? CircularProgressIndicator(color: Colors.white,): Text(
                        "Registration",
                        style: TextStyle(
                          color: Color(0xff9CA3AF),
                        ),
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
