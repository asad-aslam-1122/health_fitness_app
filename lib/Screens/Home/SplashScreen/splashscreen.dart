import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gymfitnessapp/Screens/Home/OnBoardIng/onbaording.dart'; // Import for Timer

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>const OnboardingScreen())); // Replace with your desired route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/applogo.png')),
          const SizedBox(height: 15,),
          Center(child: Image.asset('images/appname.png')),
        ],
      ),
    );
  }
}