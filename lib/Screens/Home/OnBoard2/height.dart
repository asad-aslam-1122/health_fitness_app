import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

import '../../../Widgets/custombtn.dart';
import 'goal.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int selectedHeight = 167;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(

          children: [
            const SizedBox(height: 60,),
            const Text1(
             text1:  'WHAT’S YOUR HEIGHT?',
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
                for (int i = 164; i <= 170; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedHeight = i;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: i == selectedHeight
                                ? AppColors.buttonColor
                                : Colors.transparent,
                            width: 8,
                          ),
                        ),
                      ),
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: i == selectedHeight
                              ? AppColors.buttonColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            CustomButton(text: 'Next', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const GoalScreen()));


            })
          ],
        ),
      ),
    );
  }
}