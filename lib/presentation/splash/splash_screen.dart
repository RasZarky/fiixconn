import 'dart:async';
import 'package:fiixconn/presentation/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingScreen()),
        );
      }
    });
  }

  final DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF87CEEB),
          Color(0xFF74C2EE),
          Color(0xFF87CEEB),
          Color(0xFF60B6F1),
          Color(0xFF74C2EE),
          Color(0xFF4DAAF4),
          Color(0xFF60B6F1),
          Color(0xFF3A9FF6),
          Color(0xFF4DAAF4),
          Color(0xFF2793F9),
          Color(0xFF3A9FF6),
          Color(0xFF1387FC),
          Color(0xFF2793F9),
          Color(0xFF007BFF),
          Color(0xFF1387FC),
          Color(0xFF007BFF),
        ],
        stops: [
          0.0,
          0.01,
          0.01,
          0.11,
          0.11,
          0.22,
          0.22,
          0.34,
          0.34,
          0.45,
          0.45,
          0.57,
          0.57,
          0.68,
          0.68,
          1.0,
        ],
      ),
    ),
        child: Column(
         children: [
           const SizedBox(height: 321,),
           Center(child: SvgPicture.asset('assets/svg/icon.svg')),
           const SizedBox(height: 32,),
            Text('Connect, Shop, Pay.\nEarn with us', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
           const SizedBox(height: 224.64,),
           Text('All right reserved.\n(c) ${_dateTime.year}', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
         ],
        ),
      ),
    );
  }
}