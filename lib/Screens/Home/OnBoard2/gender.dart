import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';

import 'age.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text1(
                text1: 'TELL US ABOUT YOURSELF:',
                size: 17,
              ),
              const SizedBox(height: 10),
              const Text11(
                text2:
                    'TO GIVE YOU A BETTER EXPERIENCE WE NEED\nTO KNOW YOUR GENDER',
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = true;
                    isFemaleSelected = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color:
                        isMaleSelected ? AppColors.buttonColor : Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: isMaleSelected ? Colors.black : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.male,
                          size: 40,
                          color: isMaleSelected ? Colors.black : Colors.white,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isMaleSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFemaleSelected = true;
                    isMaleSelected = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color:
                        isFemaleSelected ? AppColors.buttonColor : Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: isFemaleSelected ? Colors.black : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.female,
                          size: 40,
                          color: isMaleSelected ? Colors.white : Colors.black,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isMaleSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(text: 'Next', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const AgeScreen()));


              })
            ],
          ),
        ),
      ),
    );
  }
}
