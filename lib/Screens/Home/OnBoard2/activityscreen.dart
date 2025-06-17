import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/Authentication/sigin.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/detailstext1.dart';

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({super.key});

  @override
  State<ActivityLevelScreen> createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  String? selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            const Text1(
              text1: 'YOUR REGULAR PHYSICAL',
              size: 19,
            ), const Text1(
              text1: 'ACTIVITY LEVEL?',
              size: 19,
            ),
            const SizedBox(height: 10),
            const Text(
              'THIS HELPS US CREATE YOUR PERSONALIZED PLAN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedActivityLevel = 'Rookie';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedActivityLevel == 'Rookie'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Rookie',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedActivityLevel = 'Beginner';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedActivityLevel == 'Beginner'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Beginner',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedActivityLevel = 'Intermediate';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedActivityLevel == 'Intermediate'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Intermediate',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedActivityLevel = 'Advance';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedActivityLevel == 'Advance'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Advance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'True Beast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(text: 'Next', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));


            })
          ],
        ),
      ),
    );
  }
}