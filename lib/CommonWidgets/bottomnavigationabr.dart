
import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/home.dart';

import '../Screens/Home/Constructors/constructors.dart';
import '../Screens/Home/Insight/insightscreen.dart';
import '../Screens/Home/Profile/profilescreen.dart';
import '../Screens/Home/TrainingList/traininglist.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarExampleState createState() => BottomNavBarExampleState();
}

class BottomNavBarExampleState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // List of pages for the PageView
  final List<Widget> _pages = [
    const HomePage(),
    const InsightScreen(),
    const TrainingListScreen(),
    const FitnessTrainerScreen(),
    const ProfileScreen(),
  ];

  // Function to handle page changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xffF38B08), // Orange color for selected
        unselectedItemColor: Colors.blueGrey, // Transparent for unselected
        backgroundColor: AppColors.bgColor, // Background color for nav bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights,size: 30),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt,size: 30),
            label: 'Training List',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school,size: 30),
            label: 'Instructors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

