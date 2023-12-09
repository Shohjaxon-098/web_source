import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:web_source/model/toast.dart';
import 'package:web_source/pages/regstration_page.dart';
import 'package:web_source/widgets/form_container_widget.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showToast(message: "Password reset link sent! Check your email");
    } on FirebaseAuthException catch (e) {
      showToast(message: "Email input");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.150,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    color: Color(0xff374151),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Enter your registered email below",
                style: TextStyle(color: Color(0xff9CA3AF), fontSize: 16),
              ),
              SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  "Email address ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9CA3AF),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.063,
                width: MediaQuery.of(context).size.width * 0.85,
                child: FormContainerWidget(
                  controller: emailController,
                  onChanged: (text) {},
                  hintText: "Ex: usernamename@gmail.com",
                  isPasswordField: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 16),
                child: Row(
                  children: [
                    Text(
                      "Remember the password? ",
                      style: TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            scrollControlDisabledMaxHeightRatio: 0.76,
                            context: context,
                            builder: (context) {
                              return BuildBottomSheetLogin();
                            });
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color(0xff32B768),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.061,
                  child: ElevatedButton(
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    onPressed: () {
                      passwordReset();
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
