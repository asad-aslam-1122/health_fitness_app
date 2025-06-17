import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/WorkOut/subscriptionscreen.dart';

class StandardUserScreen extends StatelessWidget {
  const StandardUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const SubscriptionScreen()));

      },
      child: Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/userscreen.png"), fit: BoxFit.cover),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const SubscriptionScreen()));

            },
              child: Image.asset('images/premimupopup.png')),


        ),


      ),
    );
  }
}
