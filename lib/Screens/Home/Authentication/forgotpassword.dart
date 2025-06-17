import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/Authentication/sigin.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';
import 'package:gymfitnessapp/Widgets/detailstext1.dart';


class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
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
        toolbarHeight: 400, // Increase AppBar height
        flexibleSpace: Stack(
          children: [
            // Image background
            Stack(
              children: [
                Image.asset(
                  'images/login.png', // Replace with your image path
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
                child:  const Text(
                  'I Am,\nJamea',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color:AppColors.buttonColor,
                  ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text1(text1: 'Forgot Password?',size: 20,),
              const Text1(text1: 'Enter your informations below or'),
              const Text1(text1: 'login with a other account'),
              const SizedBox(height: 10,),

              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:  const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical:6,horizontal: 10),
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


              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.buttonColor,
                  ),
                  child: const Text('Try Anotherway'),
                ),
              ),
              CustomButton(text: 'Send', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));

              }),



            ],
          ),
        ),
      ),
    );
  }
}