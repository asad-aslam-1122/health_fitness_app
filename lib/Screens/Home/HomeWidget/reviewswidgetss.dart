import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';

class ReviewssWidgetss extends StatefulWidget {
  const ReviewssWidgetss({super.key});

  @override
  State<ReviewssWidgetss> createState() => ReviewssWidgetssState();
}

class ReviewssWidgetssState extends State<ReviewssWidgetss> {
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
                    'Recent',
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
                    'Critical',
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
                    'Favorable',
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