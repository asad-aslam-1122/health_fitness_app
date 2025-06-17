import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/Constructors/trainerdetails.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

class FitnessTrainerScreen extends StatefulWidget {
  const FitnessTrainerScreen({super.key});

  @override
  FitnessTrainerScreenState createState() => FitnessTrainerScreenState();
}

class FitnessTrainerScreenState extends State<FitnessTrainerScreen> {
  final List<Trainer> trainers = [
    Trainer(
      name: 'Richard Will',
      imageUrl: 'images/tr1.png',
      rating: 4.8,
      trainingType: 'High Intensity Training',
      experience: '5 years experience',
    ),
    Trainer(
      name: 'Jennifer James',
      imageUrl: 'images/tr2.png',
      rating: 4.6,
      trainingType: 'Functional Strength',
      experience: '4 years experience',
    ),
    Trainer(
      name: 'Brian Edward',
      imageUrl: 'images/tr3.png',
      rating: 4.5,
      trainingType: 'Strength Training',
      experience: '6 years experience',
    ),
    Trainer(
      name: 'Emily Kevin',
      imageUrl: 'images/tr4.png',
      rating: 4.9,
      trainingType: 'High Intensity Training',
      experience: '2 years experience',
    ), Trainer(
      name: 'Richard Will',
      imageUrl: 'images/tr1.png',
      rating: 4.8,
      trainingType: 'High Intensity Training',
      experience: '5 years experience',
    ),
    Trainer(
      name: 'Jennifer James',
      imageUrl: 'images/tr2.png',
      rating: 4.6,
      trainingType: 'Functional Strength',
      experience: '4 years experience',
    ),
    Trainer(
      name: 'Brian Edward',
      imageUrl: 'images/tr3.png',
      rating: 4.5,
      trainingType: 'Strength Training',
      experience: '6 years experience',
    ),
    Trainer(
      name: 'Emily Kevin',
      imageUrl: 'images/tr4.png',
      rating: 4.9,
      trainingType: 'High Intensity Training',
      experience: '2 years experience',
    ),
    Trainer(
      name: 'Rebecca Smith',
      imageUrl: 'images/tr5.png',
      rating: 4.8,
      trainingType: 'Functional Strength',
      experience: '8 years experience',
    ),
    Trainer(
      name: 'Ronald Jason',
      imageUrl: 'images/tr6.png',
      rating: 4.2,
      trainingType: 'High Intensity Training',
      experience: '9 years experience',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: const Text(
          'FITNESS TRAINERS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          return TrainerCard(trainer: trainers[index]);
        },
      ),
    );
  }
}

class Trainer {
  final String name;
  final String imageUrl;
  final double rating;
  final String trainingType;
  final String experience;

  Trainer({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.trainingType,
    required this.experience,
  });
}

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

   const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const TrainerDetailsScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color:AppColors.tabColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Image.asset(trainer.imageUrl),

            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text1(
                      text1:   trainer.name,
                        size: 17,
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          trainer.rating.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    trainer.trainingType,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    trainer.experience,
                    style: const TextStyle(
                      color: AppColors.buttonColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [

                SizedBox(width: 8.0),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}