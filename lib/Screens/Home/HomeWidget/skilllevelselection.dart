import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';

class SkillLevelSelector extends StatefulWidget {
  const SkillLevelSelector({super.key});

  @override
  State<SkillLevelSelector> createState() => _SkillLevelSelectorState();
}

class _SkillLevelSelectorState extends State<SkillLevelSelector> {
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
                    'Beginner',
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
                    'Intermediate',
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
                    'Advance',
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