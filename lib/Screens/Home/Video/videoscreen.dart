import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/Video/videopaused.dart';

class Videoscreen extends StatelessWidget {
  const Videoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>const VideoPausedscreen()));

      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Video.jpg"), fit: BoxFit.cover),
            ),
          
          
          ),
        )



      ),
    );
  }
}
