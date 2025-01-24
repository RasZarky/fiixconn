import 'package:fiixconn/presentation/authenttication/forgot_password_screen.dart';
import 'package:fiixconn/presentation/authenttication/sign_up_screen.dart';
import 'package:fiixconn/presentation/components/custom_button.dart';
import 'package:fiixconn/presentation/components/custom_textfeild.dart';
import 'package:fiixconn/presentation/feed/feed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User? user;

  Future<void> _login() async {
    String message = '';
    if (passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      context.loaderOverlay.show();

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );
        user = FirebaseAuth.instance.currentUser;
        context.loaderOverlay.hide();

        if (user!.emailVerified) {

          Fluttertoast.showToast(
            msg: "Click profile on bottom nav to logout",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 14.0,
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FeedScreen()),
                (Route<dynamic> route) => false,
          );

        } else {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(
            msg: "Please verify your email to sign in.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0,
          );
        }

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
      }
    } else{
      context.loaderOverlay.hide();
      Fluttertoast.showToast(
        msg: 'Please fill all fields',
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
                    children: [GestureDetector(
                      onTap: (){ Navigator.pop(context);},
                        child: SvgPicture.asset('assets/svg/arrow-left.svg'))],
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
                  onPressed: _login,
                  text: 'Log In',
                  buttonColor: Color(0xFF003366),
                  textColor: Color(0xFFFFFFFF),
                  borderColor: Color(0xFF003366),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgotten password?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF1E293B)),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                text: 'Create new account',
                borderColor: Color(0xFFE5E7EB),
                buttonColor: Colors.transparent,
              )),
        ),
      ),
    );
  }
}