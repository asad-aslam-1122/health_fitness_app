import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';

import 'activityscreen.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? selectedGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            const Text1(
              text1: 'WHAT’S YOUR GOAL?',
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
                      selectedGoal = 'Gain Weight';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedGoal == 'Gain Weight'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Gain Weight',
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
                      selectedGoal = 'Lose weight';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedGoal == 'Lose weight'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Lose weight',
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
                      selectedGoal = 'Get fitter';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedGoal == 'Get fitter'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Get fitter',
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
                      selectedGoal = 'Gain more flexible';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedGoal == 'Gain more flexible'
                              ? AppColors.buttonColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Gain more flexible',
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
                  'Learn the basic',
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
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const ActivityLevelScreen()));


            })
          ],
        ),
      ),
    );
  }
}



