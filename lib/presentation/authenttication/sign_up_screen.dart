import 'package:fiixconn/presentation/components/custom_button.dart';
import 'package:fiixconn/presentation/components/custom_textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  Future<void> _signUp() async {
    String message = '';
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      context.loaderOverlay.show();

      try {
        await auth.createUserWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );
        user = auth.currentUser;
        await user!
            .updateProfile(displayName: nameController.text);
        await user?.reload();

        await user?.sendEmailVerification();
        Fluttertoast.showToast(
          msg:
          "Registration successful! Please verify your email to sign in.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 14.0,
        );
        context.loaderOverlay.hide();
      } on FirebaseAuthException catch (e) {
        context.loaderOverlay.hide();
        message = e.message.toString();

        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      } catch (e) {
        context.loaderOverlay.hide();
        Fluttertoast.showToast(
          msg: "Failed: $e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Please fill all fields",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayWidgetBuilder: (_) {
        return Center(
          child: SpinKitCubeGrid(
            color: Color(0xFF1E293B),
            size: 50.0,
          ),
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 58),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svg/arrow-left.svg'))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                SvgPicture.asset('assets/svg/icon-dark.svg'),
                const SizedBox(
                  height: 64,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Username',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF1E293B)),
                      children: <TextSpan>[
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFFE02424)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextField(
                    hintText: "Enter email", controller: usernameController),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Full name',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF1E293B)),
                      children: <TextSpan>[
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFFE02424)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextField(
                    hintText: "Enter your name", controller: nameController),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF1E293B)),
                      children: <TextSpan>[
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFFE02424)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextField(
                  hintText: "Enter password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  onPressed: _signUp,
                  text: 'Sign Up',
                  buttonColor: Color(0xFF003366),
                  textColor: Color(0xFFFFFFFF),
                  borderColor: Color(0xFF003366),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              text: 'Already have an account?',
              borderColor: Color(0xFFE5E7EB),
              buttonColor: Colors.transparent,
            )),
      ),
    );
  }
}
