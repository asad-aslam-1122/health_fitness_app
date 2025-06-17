import 'package:flutter/material.dart';

class VideoPausedscreen extends StatelessWidget {
  const VideoPausedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Video Pause.jpg"), fit: BoxFit.cover),
            ),
          
          
          ),
        )



    );
  }
}
