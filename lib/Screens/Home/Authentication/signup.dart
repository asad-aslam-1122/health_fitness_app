import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/Authentication/sigin.dart';
import 'package:gymfitnessapp/Widgets/custom_outline_button.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';

import '../../../CommonWidgets/bottomnavigationabr.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.tabColor, // Light blue background
        elevation: 0, // Remove shadow
        toolbarHeight: 300, // Increase AppBar height
        flexibleSpace: Stack(
          children: [
            // Image background
            Stack(
              children: [
                Image.asset(
                  'images/signup.png', // Replace with your image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),

              ],
            ),
            // Content overlay (optional for text visibility)
            Center(
              child: Container(
                margin: const EdgeInsets.only(top:160),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgColor,
                      Colors.transparent,
                    ],
                  ),
                ),
                child:  const Column(
                  children: [
                    Text(
                      'Hello,Jamea',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color:AppColors.buttonColor,
                      ),
                    ),
                    Text1(text1: 'Enter your informations below or \nlogin with a other account')
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:  const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                  hintText: 'Enter Email',
                  filled: true,
                  fillColor: AppColors.buttonColor,
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide.none)


                ),

                onSaved: (value) {
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:  const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:6,horizontal: 10),
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: AppColors.buttonColor,
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderSide: BorderSide.none)


                ),

                onSaved: (value) {
                },
              ),              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:  const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 10),
                    hintText: 'Enter Again Password',
                    filled: true,
                    fillColor: AppColors.buttonColor,
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderSide: BorderSide.none)


                ),

                onSaved: (value) {
                },
              ),              const SizedBox(height: 10),

              const SizedBox(height: 20),
              CustomButton(text: 'Signup', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const BottomNavBarScreen()));

              }),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.buttonColor,
                  ),
                  child: const Text('Already HaveAn Account?'),
                ),
              ),
              CustomOutlinedButton(text: 'Login', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));

              }),



            ],
          ),
        ),
      ),
    );
  }
}