import 'package:fiixconn/presentation/authenttication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nightView.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 61),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Text('English', style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.white,)
                      ],

                    ),
                  ),
                ],
              ),
            ),
            Center(child: SvgPicture.asset('assets/svg/icon.svg')),
            Padding(
              padding: const EdgeInsets.only(bottom: 57),
              child: Row(
                children: [
                  const SizedBox(width: 24,),
                  Expanded(
                    child: CustomButton(
                      text: 'Log In',
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      buttonColor: Colors.white,
                      textColor: Color(0xFF003366),
                      borderColor: Color(0xFFE5E7EB),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: CustomButton(
                      text: 'Sign Up',
                      buttonColor: Color(0xFF003366),
                      textColor: Color(0xFFFFFFFF),
                      borderColor: Color(0xFF003366),
                    ),
                  ),
                  const SizedBox(width: 24,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
