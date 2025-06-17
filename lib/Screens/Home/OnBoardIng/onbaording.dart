import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/OnBoard2/gender.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                OnboardingItem(
                  image: 'images/b1.png',
                  title: 'Meet Your Coach, Start Your Journey',
                ),
                OnboardingItem(
                  image: 'images/2.png',
                  title: 'Create a Workout Plan To Stay Fit',
                ),
                OnboardingItem(
                  image: 'images/3.png',
                  title: 'Action Is The Key To All Success',
                  buttonLabel: 'Start Now',
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),

                      color: _currentPage == index
                          ? AppColors.buttonColor
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String? buttonLabel;

  const OnboardingItem({
    super.key,
    required this.image,
    required this.title,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const Text1(text1: ''),
          const Spacer(),
          CircleAvatar(
            radius: 180,
            backgroundImage: AssetImage(image),

          ),

          const SizedBox(height: 20),
          Center(
            child: Text1(
                     text1:    title,
              size: 20,

            ),
          ),
          const Spacer(),
          if (buttonLabel != null)
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const GenderSelectionScreen())); // Replace with your desired route

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
              child: Text(buttonLabel!,style: const TextStyle(color: Colors.black),),
            ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}