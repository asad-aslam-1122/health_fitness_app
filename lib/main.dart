import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';

import 'package:gymfitnessapp/Screens/Home/SplashScreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        useMaterial3: true,
      ),
      home: Splashscreen(),
    );
  }
}
