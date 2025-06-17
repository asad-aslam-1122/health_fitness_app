import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/HomeWidget/notificationswidget.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: const Text(
          'NOTIFICATIONS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationsWidget(),
            // Congratulations
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text(
                'Congratulations',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                '9:45 AM',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                '35% your daily challenge completed',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),

            // Attention
            ListTile(
              leading: Icon(Icons.warning, color: Colors.yellow),
              title: Text(
                'Attention',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                '9:38 AM',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Your subscription is going to expire very soon. Subscribe now.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),

            // Activity
            ListTile(
              leading: Icon(Icons.sports_basketball, color: Colors.white),
              title: Text(
                'Activity',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                '8:25 AM',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'e for your workout session',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}