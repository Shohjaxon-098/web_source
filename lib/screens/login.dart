import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:web_source/model/toast.dart';
import 'package:web_source/screens/forgot_password.dart';
import 'package:web_source/services/auth_service.dart';
import 'package:web_source/widgets/form_container_widget.dart';
import 'package:web_source/widgets/key.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool inputTextNotNull = false;
  bool isSigningUp = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      isSigningUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.popAndPushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }

  void _loginWithGoogle() async {
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
        Navigator.pushReplacementNamed(context, "/home");
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
                height: 25,
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
                        if (_emailController.text.length >= 2 &&
                            _passwordController.text.length >= 2) {
                          inputTextNotNull = true;
                        } else {
                          inputTextNotNull = false;
                        }
                      });
                    },
                    controller: _emailController,
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
                padding: const EdgeInsets.only(top: 5, left: 28, bottom: 3),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.063,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: FormContainerWidget(
                    onChanged: (value) {
                      setState(() {
                        if (_emailController.text.length >= 2 &&
                            _passwordController.text.length >= 2) {
                          inputTextNotNull = true;
                        } else {
                          inputTextNotNull = false;
                        }
                      });
                    },
                    hintText: "**** **** ****",
                    isPasswordField: true,
                    controller: _passwordController,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ForgotPassword(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Color(0xff32B768),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              inputTextNotNull
                  ? Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.061,
                        child: ElevatedButton(
                          child: Center(
                            child: isSigningUp
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 4,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                          ),
                          onPressed: () {
                            _login();
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
                          onPressed: () {
                            _login();
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
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 2),
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
                      _loginWithGoogle();
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
