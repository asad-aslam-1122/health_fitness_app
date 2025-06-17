import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/TrainingList/trainingcalendar.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

// Training List Screen
class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  TrainingListScreenState createState() => TrainingListScreenState();
}

class TrainingListScreenState extends State<TrainingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.bgColor,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          'Training List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrainingCalendar()),
                );
              },
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Week Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Week 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Week 2'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Week 3'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text('Week 4'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Daily Training Schedule
                _buildTrainingItem('Monday', 'Recovery Day',
                    Icons.directions_walk, Colors.purple),
                const SizedBox(height: 8),
                _buildTrainingItem(
                    'Tuesday',
                    'Interval Swim\nMS: 4x 200m (1,600 total)',
                    Icons.pool,
                    Colors.blue),
                const SizedBox(height: 8),
                _buildTrainingItem('Tuesday', 'Easy Bike\n50 min.',
                    Icons.directions_bike, Colors.green),
                const SizedBox(height: 8),
                _buildTrainingItem(
                    'Wednesday',
                    'Interval Run\n40 min. w/6 x 1 min. fast',
                    Icons.directions_run,
                    Colors.orange),
                const SizedBox(height: 8),
                _buildTrainingItem(
                    'Tuesday',
                    'Interval Swim\nMS: 4x 200m (1,600 total)',
                    Icons.pool,
                    Colors.blue),
                const SizedBox(height: 8),
                _buildTrainingItem('Tuesday', 'Easy Bike\n50 min.',
                    Icons.directions_bike, Colors.green),
                const SizedBox(height: 8),
                _buildTrainingItem(
                    'Wednesday',
                    'Interval Run\n40 min. w/6 x 1 min. fast',
                    Icons.directions_run,
                    Colors.orange),
                const SizedBox(height: 8),
                _buildTrainingItem(
                    'Thursday', '', Icons.directions_walk, Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function for Training Items
  Widget _buildTrainingItem(
      String day, String description, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TrainingCalendar()),
        );
      },
      child: Card(
        color: AppColors.tabColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(
                      text1: day,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: color,
                          size: 30,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            description,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                iconSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Calendar Screen
