import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/ChatFlow/chat_screen.dart';
import 'package:gymfitnessapp/Screens/Home/Fitnessaichatbot/fitnesschatbot.dart';
import 'package:gymfitnessapp/Screens/Home/Profile/reminderscreen.dart';
import 'package:gymfitnessapp/Screens/Home/Profile/userinfo.dart';
import 'package:gymfitnessapp/Screens/Home/Reviews/reviews.dart';
import 'package:gymfitnessapp/Screens/Home/Video/videoscreen.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/customapp_bar.dart';
import '../AiProgressTracker/aiprogress.dart';
import '../AiWorkoutRecommendation/recommendation.dart';
import 'calendar.dart';
import 'changepassword.dart';
import 'copuns.dart';
import 'editprofile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          children: [
            const CustomAppBar(text: 'Profile', text1: ''),
            const SizedBox(height: 20),
            Center(child: Image.asset('images/tr3.png')),
            const SizedBox(height: 10,),
            _buildProfileOption(
              context,
              icon: Icons.person,
              title: 'User Information',
              screen: const UserInformation(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.chat_bubble_outline, // Represents a chatbot
              title: 'AI Assistant ChatBot',
              screen: const FitnessChatScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.fitness_center, // Represents workout/fitness
              title: 'AI Workout Recommendation',
              screen: const WorkoutRecommendationScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.insights, // Represents analysis/tracking
              title: 'AI Fitness Progress Tracker',
              screen: const AIProgressTracker(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.notifications,
              title: 'Reminder',
              screen: const ReminderScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.calendar_today,
              title: 'Calendar',
              screen: const AvailabilityCalendarScheduleScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.reviews,
              title: 'Reviews',
              screen: const ReviewsScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.discount,
              title: 'Coupons',
              screen: CouponsScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.video_library,
              title: 'Video',
              screen: const Videoscreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.chat,
              title: 'ChatScreen',
              screen: const ChatScreen(),
            ),
            _buildProfileOption(
              context,
              icon: Icons.lock,
              title: 'Change Password',
              screen: const ChangePassword(),
            ),
            const Divider(),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              screen: const EditProfile(),
            ),
          ],
        ),
      ),
    );
  }

  // Refactored helper method to avoid repetitive code
  Widget _buildProfileOption(BuildContext context, {
    required IconData icon,
    required String title,
    required Widget screen,
  }) {
    return ProfileRow(
      leadingIcon: icon,
      title: title,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;

  const ProfileRow({
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.tabColor,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(leadingIcon, color: AppColors.text3Color),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.text3Color),
            ],
          ),
        ),
      ),
    );
  }
}
