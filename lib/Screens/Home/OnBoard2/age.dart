import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/OnBoard2/weight.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

import '../../../Widgets/custombtn.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int selectedAge = 36;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            const Text1(
              text1: 'HOW OLD ARE YOU?',
            size: 17,
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
                for (int i = 33; i <= 39; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = i;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: i == selectedAge
                                ? AppColors.buttonColor
                                : Colors.transparent,
                            width: 4,
                          ),
                        ),
                      ),
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: i == selectedAge
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
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const WeightScreen()));


            })

          ],
        ),
      ),
    );
  }
}





