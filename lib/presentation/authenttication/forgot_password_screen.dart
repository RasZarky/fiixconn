import 'package:fiixconn/presentation/authenttication/sign_up_screen.dart';
import 'package:fiixconn/presentation/components/custom_button.dart';
import 'package:fiixconn/presentation/components/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: (){Navigator.pop(context);},
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
                    text: 'Email',
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
                height: 32,
              ),
              CustomButton(
                text: 'Reset password',
                buttonColor: Color(0xFF003366),
                textColor: Color(0xFFFFFFFF),
                borderColor: Color(0xFF003366),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              );
            },
            text: 'Log In',
            borderColor: Color(0xFFE5E7EB),
            buttonColor: Colors.transparent,
          )),
    );
  }
}
