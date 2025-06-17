import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

import '../../../Widgets/custombtn.dart';
import 'height.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double selectedWeight = 54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            const Text1(
             text1:  'WHAT’S YOUR WEIGHT?',
              size: 18,

            ),
            const SizedBox(height: 10),
            const Text(
              'YOU CAN ALWAYS CHANGE THIS LATER',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const Spacer(),

            Slider(
              value: selectedWeight,
              activeColor: AppColors.buttonColor,
              min: 40,
              max: 120,
              divisions: 80,
              label: selectedWeight.round().toString(),
              onChanged: (value) {
                setState(() {
                  selectedWeight = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              '${selectedWeight.round()} kg',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            CustomButton(text: 'Next', onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const HeightScreen()));


            })
          ],
        ),
      ),
    );
  }
}