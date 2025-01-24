import 'dart:io';

import 'package:fiixconn/presentation/miniApps/mini_apps_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../authenttication/login_screen.dart';


class BottomBar extends StatelessWidget {
   final BuildContext context;
   BottomBar({super.key, required this.context});

   final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<void> _signOut() async {
     try {
       await _auth.signOut();
       Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(builder: (context) => LoginScreen()),
         (Route<dynamic> route) => false,
       );
     } catch (e) {
       Fluttertoast.showToast(
         msg: 'Error signing out: $e',
         toastLength: Toast.LENGTH_LONG,
         gravity: ToastGravity.SNACKBAR,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 14.0,
       );
       print('Error signing out: $e');
     }
   }

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 94,
      decoration:
          BoxDecoration(color: Colors.black, border: Border(top: BorderSide(color: Colors.black12))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                menuButton('Mini Apps', 'assets/svg/layer.svg', 0, context),
                menuButton('Messages', 'assets/svg/chat.svg', 1, context),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset('assets/svg/add-square.svg'),
                SizedBox(
                  width: 15,
                ),
                menuButton('Notifications', 'assets/svg/notification.svg', 2, context),
                menuButton('Profile', 'assets/svg/profile.svg', 3, context)
              ],
            ),
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, String icon, int index, BuildContext context) {
    return GestureDetector(
        onTap: () {
          switch (index) {
          case 0:  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MiniAppsScreen()),
          );
          case 3: _signOut();
          }
        },
        child: SizedBox(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(icon),
              SizedBox(
                height: 7,
              ),
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF93A2B7),
                    fontSize: 10),
              )
            ],
          ),
        ));
  }
}
