import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BottomBar extends StatelessWidget {

  const BottomBar({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton('Mini Apps', 'assets/svg/layer.svg', 0),
              menuButton('Messages', 'assets/svg/chat.svg', 1),
              SizedBox(
                width: 15,
              ),
              SvgPicture.asset('assets/svg/add-square.svg'),
              SizedBox(
                width: 15,
              ),
              menuButton('Notifications', 'assets/svg/notification.svg', 2),
              menuButton('Profile', 'assets/svg/profile.svg', 3)
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, String icon, int index) {
    return GestureDetector(
        onTap: () {
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
