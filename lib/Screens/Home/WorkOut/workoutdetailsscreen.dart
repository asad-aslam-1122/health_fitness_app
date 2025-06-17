import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/workoutcategories.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';



class WorkOutDetails extends StatefulWidget {
  const WorkOutDetails({super.key});

  @override
  WorkOutDetailsState createState() => WorkOutDetailsState();
}

class WorkOutDetailsState extends State<WorkOutDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  Image.asset(
                    'images/workoutplanp1.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text1(
                     text1:  'Day 01 - Warm Up',
                      size: 17,

                    ),
                    const SizedBox(height: 4),
                    const Text11(
                     text2:  '04 Workouts for Beginner',
                      color: AppColors.buttonColor,

                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Row(
                            children: <Widget>[
                              Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '60 min',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Row(
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '350 Cal',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text11(
                    text2:   'Want your body to be healthy. Join our program with directions according to body\'s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week Want your body to be healthy. Join our program with directions according.',



                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return WorkoutItem(
                          title: index == 0
                              ? 'Simple Warm-Up Exercises'
                              : 'Stability Training Basics',
                          imageUrl: index == 0
                              ? 'images/home1.png'
                              : 'images/home2.png',
                          duration: '0:30',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.bgColor,
        child: CustomButton(text: 'Start Workout', onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const Workoutcategories()));

        }),

      ),
    );

  }
}

class WorkoutItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String duration;

  const WorkoutItem({super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      child: Card(
        color: AppColors.tabColor,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 100,
                width: 120,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text1(
                     text1:  title,
                     size: 16,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}