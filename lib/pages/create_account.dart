import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';
import 'package:web_source/model/toast.dart';
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
  bool inputTextNotNull = false;
  final FirebaseAuthService _fireBaseAuthService = FirebaseAuthService();
  bool _isSigning = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _createAccount() async {
    setState(() {
      _isSigning = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    User? user =
        await _fireBaseAuthService.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "some error occured");
    }
  }

  void _createAccountWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pop(
          context,
          PageTransition(
              child: HomePage(), type: PageTransitionType.rightToLeft),
        );
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
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
                    onChanged: (text) {
                      setState(() {
                        if (emailController.text.length >= 2 &&
                            passwordController.text.length >= 2 &&
                            confirmPassword.text.length >= 2) {
                          inputTextNotNull = true;
                        } else {
                          inputTextNotNull = false;
                        }
                      });
                    },
                    controller: emailController,
                    hintText: "Ex: usernamename@gmail.com",
                    isPasswordField: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
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
                    onChanged: (value) {
                      setState(() {
                        if (emailController.text.length >= 2 &&
                            passwordController.text.length >= 2 &&
                            confirmPassword.text.length >= 2) {
                          inputTextNotNull = true;
                        } else {
                          inputTextNotNull = false;
                        }
                      });
                    },
                    hintText: "**** **** ****",
                    isPasswordField: true,
                    controller: passwordController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: const Text(
                  "Confirm Password",
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
                    onChanged: (value) {
                      setState(() {
                        if (emailController.text.length >= 2 &&
                            passwordController.text.length >= 2 &&
                            confirmPassword.text.length >= 2) {
                          inputTextNotNull = true;
                        } else {
                          inputTextNotNull = false;
                        }
                      });
                    },
                    controller: confirmPassword,
                    isPasswordField: true,
                    hintText: "**** **** ****",
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              inputTextNotNull
                  ? Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.061,
                        child: ElevatedButton(
                          child: Center(
                            child: _isSigning
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 4,
                                  )
                                : Text(
                                    "Registration",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                          ),
                          onPressed: () {
                            _createAccount();
                          },
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(0.7),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff32B768)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.061,
                        child: ElevatedButton(
                          child: Center(
                            child: Text(
                              "Registration",
                              style: TextStyle(
                                color: Color(0xff9CA3AF),
                              ),
                            ),
                          ),
                          onPressed: () {},
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
                      _createAccountWithGoogle();
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

  // void _signUp() async {
  //   setState(() {
  //     isSigningUp = true;
  //   });

  //   String username = _usernameController.text;
  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user =
  //       await _fireBaseAuthService.signUpWithEmailAndPassword(email, password);

  //   setState(() {
  //     isSigningUp = false;
  //   });
  //   if (user != null) {
  //     showToast(message: "User is successfully created");
  //     Navigator.pushNamed(context, "/home");
  //   } else {
  //     showToast(message: "Some error happend");
  //   }
  // }
}
