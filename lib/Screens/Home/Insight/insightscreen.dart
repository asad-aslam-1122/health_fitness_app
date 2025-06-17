import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  @override
  InsightScreenState createState() => InsightScreenState();
}

class InsightScreenState extends State<InsightScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Section
              Card(
                color: Colors.grey[850],
                child: TableCalendar(
                  headerStyle: const HeaderStyle(
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    leftChevronVisible: true,
                    formatButtonVisible: true,
                    rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    leftChevronIcon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                    titleTextStyle: TextStyle(color: Colors.white),
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _selectedDay,
                  calendarFormat: CalendarFormat.week,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    todayTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.white),
                    isTodayHighlighted: true,
                    defaultTextStyle: TextStyle(color: Colors.white),
                    selectedDecoration: BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Active Calories (Large Gauge)
              Center(child: buildCircularIndicator("652 Cal", Colors.orange, "Active", radius: 90.0, lineWidth: 8.0)),
              const SizedBox(height: 20),

              // Metrics Section (3 smaller gauges in 1 row)
              SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCircularIndicator("6540", Colors.blue, "Steps"),
                    const SizedBox(width: 11,),
                    buildCircularIndicator("45 min", Colors.green, "Time"),
                    const SizedBox(width: 11,),

                    buildCircularIndicator("72 bpm", Colors.red, "Heart Rate"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Finished Workout Section
              const Text(
                "Finished Workout",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),

              // List of Workouts
              Expanded(
                child: AnimationLimiter(
                  child: ListView(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(child: widget),
                      ),
                      children: [
                        buildWorkoutTile("Stability Training", "10:00"),
                        buildWorkoutTile("Flash Cycling", "30:00"),
                        // Add more workouts as needed
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Circular Gauge
  // Build Circular Gauge
  Widget buildCircularIndicator(String value, Color color, String label, {double radius = 56.0, double lineWidth = 6.0}) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      percent: 0.7, // Change according to your logic
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: radius / 4)),  // Value
          const SizedBox(height: 4),  // Space between value and label
          Text(label, style: TextStyle(color: Colors.white, fontSize: radius / 5)),  // Label inside
        ],
      ),
      progressColor: color,
      backgroundColor: Colors.grey[800]!,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }


  // Build Workout Tile
  Widget buildWorkoutTile(String workoutName, String duration) {
    return Card(
      color: AppColors.tabColor,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(workoutName, style: const TextStyle(color: Colors.white)),
        subtitle: Text(duration, style: const TextStyle(color: AppColors.buttonColor)),
        trailing: const Icon(Icons.check_circle, color: AppColors.buttonColor),
        tileColor:AppColors.tabColor,
      ),
    );
  }
}
