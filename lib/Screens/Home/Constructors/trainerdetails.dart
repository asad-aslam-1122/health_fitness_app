import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/ChatFlow/chat_screen.dart';
import 'package:gymfitnessapp/Screens/Home/Reviews/reviews.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';

import '../BookingAppointment/appointmentscreen.dart';



class TrainerDetailsScreen extends StatefulWidget {
  const TrainerDetailsScreen({super.key});

  @override
  TrainerDetailsScreenState createState() => TrainerDetailsScreenState();
}

class TrainerDetailsScreenState extends State<TrainerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset('images/trainerdeatils.png',
                      fit: BoxFit.cover, height: 200),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((0.2 * 255).toInt()),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text1(
                           text1:  'Jennifer James',
                           size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text11(
                           text2:  'Functional Strength',
                            color: AppColors.buttonColor,


                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> const ChatScreen()));

                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.buttonColor,
                          child: Icon(Icons.call),



                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(
                        value: '6',
                        label: 'Experience',
                      ),
                      StatCard(
                        value: '46',
                        label: 'Completed',
                      ),
                      StatCard(
                        value: '25',
                        label: 'Active Clients',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text1(
                      text1:   'Reviews',
                        size: 18,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          '4.3',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('images/tr2.png'),
                            radius: 20,
                          ),
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('images/tr3.png'),
                            radius: 20,
                          ),
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('images/tr4.png'),
                            radius: 20,
                          ),
                         
                          CircleAvatar(
                           backgroundColor: AppColors.buttonColor,
                            radius: 20,
                            child: Center(child: Text1(text1: '178',color: Colors.black,),),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> const ReviewsScreen()));

                        },
                        child: const Text(
                          'Read all reviews',
                          style: TextStyle(
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ReviewCard(
                    name: 'Sharon Jem',
                    rating: 4.8,
                    date: '2d ago',
                    content:
                    'Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(text: 'Book an Appointment', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const Appointments()));

                  }),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;

  const StatCard({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String content;

  const ReviewCard({super.key,
    required this.name,
    required this.rating,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                AssetImage('images/tr1.png'),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 7,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          '174',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$rating',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}