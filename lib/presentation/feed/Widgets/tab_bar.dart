import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 26,
       color: Colors.transparent,
      child: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        dividerColor: Colors.transparent,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 8.0),
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        tabs: const [
          Tab(text: 'LIVE'),
          Tab(text: 'Following'),
          Tab(text: 'For You'),
        ],
      ),
    );
  }
}