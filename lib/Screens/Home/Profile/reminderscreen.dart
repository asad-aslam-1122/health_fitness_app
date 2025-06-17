import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';



class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  ReminderScreenState createState() => ReminderScreenState();
}

class ReminderScreenState extends State<ReminderScreen> {
// Keep as TimeOfDay
  String _selectedRepeat = 'Everyday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {},
        ),
        title: const Text('Reminder',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text1(
            text1:   'Please select reminder time',
              size: 17,
            ),
            const SizedBox(height: 20),

            // Time Picker (using flutter_time_picker_spinner)
            TimePickerSpinner(
              is24HourMode: false, // Set to true for 24-hour format
              normalTextStyle: const TextStyle(fontSize: 24, color: Colors.grey),
              highlightedTextStyle:
              const TextStyle(fontSize: 24, color: Color(0xFFB6C1F3)),
              spacing: 20, // Space between spinners
              onTimeChange: (newTime) { // newTime is TimeOfDay
                setState(() {
// Assign TimeOfDay to TimeOfDay
                });
              },
            ),

            const SizedBox(height: 20),
            const Text(
              'How often repeat',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Repeat Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedRepeat = 'Everyday';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRepeat == 'Everyday'
                        ? const Color(0xFFB6C1F3)
                        : AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Everyday'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedRepeat = 'Mon - Fri';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRepeat == 'Mon - Fri'
                        ? AppColors.buttonColor
                        : Colors.grey[300],
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Mon - Fri'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedRepeat = 'Weekends';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedRepeat == 'Weekends'
                        ? const Color(0xFFB6C1F3)
                        : AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Weekends'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Days of the Week
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Mon'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Tue'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Wed'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Thu'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Fri'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Sat'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Sun'),
                ),
              ],
            ),

            const Spacer(),

            CustomButton(text: 'Save', onTap: (){})
            // Save Button
            
          ],
        ),
      ),
    );
  }
}