import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/BookingAppointment/appointmentscreen.dart';

class Prouserscreen extends StatelessWidget {
  const Prouserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const Appointments()));

      },
      child: Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/userscreen.png"), fit: BoxFit.cover),
          ),
          child: Image.asset('images/userpopup.png'),


        ),


      ),
    );
  }
}
