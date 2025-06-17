import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';
import 'package:gymfitnessapp/Widgets/text11.dart';

import '../Constructors/constructors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  SubscriptionScreenState createState() => SubscriptionScreenState();
}

class SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isYearlySelected = false;

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
                    'images/Background.png',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    left: 10,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text1(
                          text1: 'BE PREMIUM',
                          size: 33,
                          color: AppColors.buttonColor,
                        ),
                        Text1(
                          text1: 'GET UNLIMITED \n ACCESS',
                          size: 25,
                          color: Colors.white,
                        ),
                        Text11(
                            text2: 'When you subscribe, you’ll get instant unlimited access')
                      ],
                    ),
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
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.tabColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isYearlySelected
                              ? Colors.transparent
                              : Colors.red, // Border color for monthly
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: isYearlySelected
                                    ? AppColors.tabColor
                                    : Colors.red,
                                size: 12,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Monthly',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '\$19.99 /m',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.tabColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isYearlySelected
                              ? Colors.red
                              : Colors.transparent, // Border color for yearly
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: isYearlySelected, // Use the state variable for value
                                groupValue: isYearlySelected,
                                onChanged: (value) {
                                  setState(() {
                                    isYearlySelected = value!; // Cast to bool
                                  });
                                },
                                activeColor: Colors.red,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Yearly',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '\$129.99 /y',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
        child: CustomButton(
          text: 'Subscribe  Now',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const FitnessTrainerScreen()));
          },
        ),
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text1(
                      text1: title,
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