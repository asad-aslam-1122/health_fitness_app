import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Widgets/custombtn.dart';

class AvailabilityCalendarScheduleScreen extends StatefulWidget {
  const AvailabilityCalendarScheduleScreen({super.key});

  @override
  AvailabilityCalendarScheduleScreenState createState() =>
      AvailabilityCalendarScheduleScreenState();
}

class AvailabilityCalendarScheduleScreenState
    extends State<AvailabilityCalendarScheduleScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTimeSlot = '';

  // Mock available time slots for specific dates
  final Map<DateTime, List<String>> _availableTimeSlots = {
    DateTime.utc(2024, 9, 15): ['9:00 AM', '11:00 AM', '2:00 PM', '4:00 PM'],
    DateTime.utc(2024, 9, 16): ['10:00 AM', '12:00 PM', '3:00 PM'],
    DateTime.utc(2024, 9, 17): ['8:00 AM', '1:00 PM', '5:00 PM'],
  };

  List<String> getTimeSlotsForDate(DateTime date) {
    return _availableTimeSlots[DateTime.utc(date.year, date.month, date.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: const Text('Availablity',style: TextStyle(color: Colors.white),),
        
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
          child: Column(
            children: [
              // Calendar View
              const SizedBox(height: 20),

              _buildCalendar(),
              const SizedBox(height: 20),

              // Selected Date
              Text(
                'Available Slots for ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Availability Schedule (time slots)
              Expanded(
                child: _buildTimeSlots(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // Build Calendar Widget
  Widget _buildCalendar() {
    return Card(
      color: AppColors.tabColor,

      child: TableCalendar(

        headerStyle: const HeaderStyle(titleTextStyle: TextStyle(color: Colors.white),
          rightChevronIcon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
          leftChevronIcon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
          formatButtonTextStyle: TextStyle(color: Colors.white),
          titleCentered: true


        
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red),
          weekdayStyle: TextStyle(color: Colors.blue,

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
            _selectedTimeSlot = ''; // Reset selected time slot on new date
          });
        },
        calendarStyle: const CalendarStyle(
           outsideTextStyle: TextStyle(color:Colors.pink),
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
  Widget _buildTimeSlots() {
    final timeSlots = getTimeSlotsForDate(_selectedDate);

    if (timeSlots.isEmpty) {
      return const Center(
        child: Text(
          'No available time slots for this date.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2.5,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        bool isSelected = timeSlots[index] == _selectedTimeSlot;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTimeSlot = timeSlots[index];
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.deepPurpleAccent : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade300,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              timeSlots[index],
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }

  // Build Bottom Navigation Bar for Confirmation
  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 13),
      child: CustomButton(text: 'Confirm Booking', onTap:(){}),
    );
  }
}
