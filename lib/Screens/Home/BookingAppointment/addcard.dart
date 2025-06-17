import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Screens/Home/BookingAppointment/completedpaymentscreen.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Add New Card',
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
            const SizedBox(height: 16),
            Image.asset(
              'images/paymentcard.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const Text(
              'Card Holder Name',
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  hintText: 'Enter Card Number',
                  filled: true,
                  fillColor: AppColors.tabColor,
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              onSaved: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  hintText: 'Enter Card Holder Name',
                  filled: true,
                  fillColor: AppColors.tabColor,
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              onSaved: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        hintText: 'Enter Expiry (MM/YY)',
                        filled: true,
                        fillColor: AppColors.tabColor,
                        hintStyle: TextStyle(color: Colors.white),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                    onSaved: (value) {},
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        hintText: 'Enter CVV',
                        filled: true,
                        fillColor: AppColors.tabColor,
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(borderSide: BorderSide.none)),
                    onSaved: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: false,
                  activeColor: AppColors.buttonColor,
                  onChanged: (value) {},
                ),
                const Text('Set as default payment card'),
              ],
            ),
            CustomButton(text: 'Confirm', onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const PaymentCompletedScreen()));

            }),
          ],
        ),
      ),
    );
  }
}
