import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/BookingAppointment/addcard.dart';
import 'package:gymfitnessapp/Screens/Home/BookingAppointment/completedpaymentscreen.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'PAYMENT',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const AddNewCardScreen()));

                    },
                    child: Container(
                      height: 90,
                      width: 70,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.tabColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VISA',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 5),
                            Icon(Icons.circle, size: 5),
                            Icon(Icons.circle, size: 5),
                            SizedBox(width: 3),
                            Text('2048'),
                            SizedBox(width: 5),
                            Icon(Icons.check_circle,
                                size: 16, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.credit_card, size: 32),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 6),
                            Icon(Icons.circle, size: 6),
                            Icon(Icons.circle, size: 6),
                            SizedBox(width: 8),
                            Text('2071'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Order Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/tr2.png'),
                  radius: 30,
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
                          color: Colors.white),
                    ),
                    Text(
                      'High Intensity Training',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[800],
            ),
            const SizedBox(height: 10),
            const Text(
              'Date',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              '20 October 2021 - Wednesday',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[800],
            ),
            const SizedBox(height: 16),
            const Text(
              'Time',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              '09:30 AM',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[800],
            ),
            const SizedBox(height: 10),
            const Text(
              'Estimated Cost',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$ 175.99',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 32),
            const Spacer(),
            CustomButton(
                text: 'Confirm',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PaymentCompletedScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
