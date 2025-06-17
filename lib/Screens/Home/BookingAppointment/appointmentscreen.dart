import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/BookingAppointment/paymentscreen.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Widgets/detailstext1.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  AppointmentsState createState() => AppointmentsState();
}

class AppointmentsState extends State<Appointments> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String? _selectedTime;


  // Clamp focusedDay to the valid range
  DateTime get _clampedFocusedDay {
    final firstDay = DateTime.utc(2021, 10, 1);
    final lastDay = DateTime.utc(2024, 10, 31);
    if (_focusedDay.isBefore(firstDay)) {
      return firstDay;
    } else if (_focusedDay.isAfter(lastDay)) {
      return lastDay;
    }
    return _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'APPOINTMENT',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.tabColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Image.asset('images/tr5.png'),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text1(
                                text1: 'Emily Kevin',
                                size: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 1.0),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text(
                                  '3.6',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            'High Intensity Training',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            '2 years experience',
                            style: TextStyle(
                              color: AppColors.buttonColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: AppColors.tabColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TableCalendar(
                      focusedDay: _clampedFocusedDay, // Use clamped focused day
                      firstDay: DateTime.utc(2021, 10, 1),
                      lastDay: DateTime.utc(2024, 10, 31),
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarStyle: const CalendarStyle(
                        isTodayHighlighted: true,
                        selectedTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle,
                        ),
                        defaultDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        weekendDecoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: AppColors.buttonColor),
                        weekendStyle: TextStyle(color: Colors.orange),
                      ),
                      headerStyle: const HeaderStyle(
                        titleTextStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        formatButtonVisible: false,
                        leftChevronIcon:
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                        rightChevronIcon:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                        headerPadding: EdgeInsets.all(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TimeSelection(
                      selectedTime: _selectedTime,
                      onTimeSelected: (time) {
                        setState(() {
                          _selectedTime = time;
                        });
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PaymentScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSelection extends StatelessWidget {
  final String? selectedTime;
  final Function(String) onTimeSelected;

  const TimeSelection(
      {super.key, this.selectedTime, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TimeButton(
              time: '09:00 AM',
              selected: selectedTime == '09:00 AM',
              onPressed: () {
                onTimeSelected('09:00 AM');
              },
            ),
            TimeButton(
              time: '09:30 AM',
              selected: selectedTime == '09:30 AM',
              onPressed: () {
                onTimeSelected('09:30 AM');
              },
            ),
            TimeButton(
              time: '10:00 AM',
              selected: selectedTime == '10:00 AM',
              onPressed: () {
                onTimeSelected('10:00 AM');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class TimeButton extends StatelessWidget {
  final String time;
  final bool selected;
  final Function() onPressed;

  const TimeButton({
    super.key,
    required this.time,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.buttonColor : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          time,
          style: TextStyle(
            fontSize: 14,
            color: selected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
