import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  int _selectedSkillLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.tabColor,
          borderRadius: BorderRadius.circular(20)


      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSkillLevel = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: _selectedSkillLevel == 0 ? AppColors.buttonColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'News',
                    style: TextStyle(
                      color: _selectedSkillLevel == 0 ? Colors.black : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSkillLevel = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: _selectedSkillLevel == 1 ? AppColors.buttonColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'Events',
                    style: TextStyle(
                      color: _selectedSkillLevel == 1 ? Colors.black : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSkillLevel = 2;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: _selectedSkillLevel == 2 ? AppColors.buttonColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: _selectedSkillLevel == 2 ? Colors.black : Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}