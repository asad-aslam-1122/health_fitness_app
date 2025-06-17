import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/prouserscreen.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/standarduserscreen.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';

import '../HomeWidget/skilllevelselection.dart';

class Workoutcategories extends StatelessWidget {
  const Workoutcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Column(
          children: [
            const Center(
                child: Text1(
              text1: 'Workout Categories',
              size: 17,
            )),
            const SizedBox(
              height: 6,
            ),
            const SkillLevelSelector(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  WorkOutCateoriesConatiner(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Prouserscreen()));

                    },
                    image: 'images/walkupcall.png',
                    text1: 'Wake Up Call',
                    ttext2: '04 Workouts  for Beginner',
                  ),
                  WorkOutCateoriesConatiner(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const StandardUserScreen()));

                    },

                    image: 'images/fullbody.png',
                    text1: 'Full Body Goal Crusher',
                    ttext2: '07 Workouts  for Beginner',
                    color1: const Color(0xffFF2424
                    ),
                    color2: Colors.white,
                  ),
                  WorkOutCateoriesConatiner(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const StandardUserScreen()));

                    },

                    image: 'images/lowbodddy.png',
                    text1: 'Lower Body Strength',
                    ttext2: '04 Workouts  for Beginner',
                    color1: const Color(0xffFF2424
                    ),
                    color2: Colors.white,
                  ),
                  WorkOutCateoriesConatiner(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const StandardUserScreen()));

                    },

                    image: 'images/walkupcall.png',
                    text1: 'Wake Up Call',
                    ttext2: '04 Workouts  for Beginner',
                    color1: const Color(0xffFF2424
                    ),
                    color2: Colors.white,
                  ),
                  WorkOutCateoriesConatiner(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const StandardUserScreen()));

                    },

                    image: 'images/fullbody.png',
                    text1: 'Full Body Goal Crusher',
                    ttext2: '07 Workouts  for Beginner',
                    color1: const Color(0xffFF2424
                    ),
                    color2: Colors.white,

                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class WorkOutCateoriesConatiner extends StatelessWidget {
  final String image, text1, ttext2;
  final Color? color1,color2;
  final VoidCallback onTap;
  const WorkOutCateoriesConatiner({
    super.key,
    required this.image,
    required this.text1,
    required this.ttext2, this.color1, this.color2, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned(
                  left: 10,
                  bottom: 12,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text1(
                            text1: text1,
                            size: 17,
                          ),
                          Text11(
                            text2: ttext2,
                            color: AppColors.buttonColor,
                          )
                        ],
                      ),


                    ],
                  )),
              Positioned(
                  right: 10,
                  bottom: 12,
                  child:                     Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 1),
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(6)

                    ),
                    child: Center(
                      child: Text1(text1: 'PRO',size: 10,color: color2,),
                    ),
                  ))

                ],
          )),
    );
  }
}
