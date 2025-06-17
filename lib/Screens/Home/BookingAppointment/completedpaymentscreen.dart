import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';

class PaymentCompletedScreen extends StatelessWidget {
  const PaymentCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 30,
                  color: Colors.green,
                ),
                SizedBox(width: 16),
                Text(
                  'Payment Completed!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'You\'ve book a new appointment with your trainer.',
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: AppColors.tabColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trainer',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/tr4.png'),
                        radius: 20,
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emily Kevin',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            'High Intensity Training',
                            style: TextStyle(fontSize: 14, color: AppColors.buttonColor
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '4.9',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Date',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,                              color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('20 October 2021 - Wednesday',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 16),
                  const Text(
                    'Time',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: AppColors.buttonColor),
                  ),
                  const SizedBox(height: 8),
                  const Text('09:30 AM',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.notifications_active, size: 24,color: Colors.white,),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'Done', onTap: (){

            }),


          ],
        ),
      ),
    );
  }
}