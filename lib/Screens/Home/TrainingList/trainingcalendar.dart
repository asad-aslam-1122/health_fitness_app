import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Widgets/detailstext1.dart';

class TrainingCalendar extends StatefulWidget {
  const TrainingCalendar({super.key});

  @override
  TrainingCalendarState createState() => TrainingCalendarState();
}

class TrainingCalendarState extends State<TrainingCalendar> {
  DateTime _selectedDate = DateTime.now();

  // Mock available time slots for specific dates
  final Map<DateTime, List<String>> _availableTimeSlots = {
    DateTime.utc(2024, 9, 15): ['9:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'],
    DateTime.utc(2024, 9, 16): ['10:00 AM', '12:00 PM', '3:00 PM'],
    DateTime.utc(2024, 9, 17): ['8:00 AM', '1:00 PM', '5:00 PM'],
  };

  List<String> getTimeSlotsForDate(DateTime date) {
    return _availableTimeSlots[DateTime.utc(date.year, date.month, date.day)] ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Availablity',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar View
              const SizedBox(height: 10),

              _buildCalendar(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text1(
                  text1: 'Completed',
                  size: 16,
                ),
              ),
              const SizedBox(height: 8),

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
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
                  ],
                ),
              ),

              // Selected Date
            ],
          ),
        ),
      ),
    );
  }

  // Build Calendar Widget
  Widget _buildCalendar() {
    return Card(
      color: AppColors.tabColor,
      child: TableCalendar(
        headerStyle: const HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.white),
            rightChevronIcon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
            leftChevronIcon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            titleCentered: true),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.red),
          weekdayStyle: TextStyle(
            color: Colors.blue,
          ),
        ),
        pageAnimationDuration: const Duration(milliseconds: 20),
        weekNumbersVisible: false,
        focusedDay: _selectedDate,
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2025, 12, 31),
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDate = selectedDay;
// Reset selected time slot on new date
          });
        },
        calendarStyle: const CalendarStyle(
          outsideTextStyle: TextStyle(color: Colors.pink),
          defaultTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            shape: BoxShape.circle,
          ),
          weekendTextStyle: TextStyle(color: AppColors.buttonColor),
        ),
      ),
    );
  }

  // Build Time Slots Grid

  // Build Bottom Navigation Bar for Confirmation

  Widget _buildTrainingItem(
      String day, String description, IconData icon, Color color) {
    return Card(
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
    );
  }
}
