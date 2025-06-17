import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/workoutcategories.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/workoutdetailsscreen.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/detailstext2.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';

import 'HomeWidget/skilllevelselection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text1(
                    text1: 'Hello',
                    size: 35,
                    color: AppColors.buttonColor,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text1(
                    text1: 'James',
                    size: 35,
                    color: Colors.white,
                  ),
                ],
              ),
              const Text2(text2: 'Good morning.'),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const WorkOutDetails()));
                    },
                    child: const Text1(
                      text1: 'Today Workout Plan',
                      size: 17,
                    ),
                  ),
                  const Spacer(),
                  const Text11(
                    text2: 'Mon 26 Apr',
                    color: AppColors.buttonColor,
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const WorkOutDetails()));

                },
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    width: double.infinity,
                    child: Image.asset(
                      'images/home1.png',
                      fit: BoxFit.fitWidth,
                    )),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Workoutcategories()));

                    },
                    child: const Text1(
                      text1: 'Workout Categories',
                      size: 17,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Workoutcategories()));

                    },
                    child: const Text11(
                      text2: 'See All',
                      color: AppColors.buttonColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6,),
              const SkillLevelSelector(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Workoutcategories()));

                    },
                    child: Row(
                      children: [
                        Image.asset('images/home2.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('images/home2.png'),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text1(
                      text1: 'What Do You Want to Train',
                      size: 17,
                    ),
                    Spacer(),
                    Text11(
                      text2: '',
                      color: AppColors.buttonColor,
                    )
                  ],
                ),
              ),
              const WorkTrainerWidget(
                text1: 'Fullbody Workout',
                image: 'images/layer2.png',


              ),const WorkTrainerWidget(
                text1: 'Lowebody Workout',
                image: 'images/layer1.png',


              ),const WorkTrainerWidget(
                text1: 'AB Workout',
                image: 'images/layer1.png',


              ),
            ],
          ),
        ),
      )),
    );
  }
}

class WorkTrainerWidget extends StatelessWidget {
  final String text1,image;
  const WorkTrainerWidget({
    super.key, required this.text1, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,vertical: 10
      ),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(8)

      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text1(text1:text1),
              const SizedBox(height: 3,),
              const Text2(text2: '11 Exercises | 32mins'),
              const SizedBox(height: 10,),

              Container(
                padding: const EdgeInsets.symmetric(

                  horizontal: 15,
                  vertical: 5
                ),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(20)

                ),
                child: const Center(
                  child: Text1(text1: 'View More',color: Colors.black,),


                ),

              )



            ],


          ),
          const Spacer(),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            backgroundImage:AssetImage(image) ,


          )


        ],


      ),




    );
  }
}
