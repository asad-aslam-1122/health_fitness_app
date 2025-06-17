import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';

import '../../../Widgets/customapp_bar.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/detailstext1.dart';


class CouponsScreen extends StatelessWidget {
  final List<Map<String, String>> coupons = [
    {
      'code': 'WELCOME200',
      'description': 'Add items worth \$2 more to unlock',
      'offer': 'Get 50% OFF',
    },
    {
      'code': 'CASHBACK12',
      'description': 'Add items worth \$2 more to unlock',
      'offer': 'Up to \$12.00 cashback',
    },
    {
      'code': 'FEST2COST',
      'description': 'Add items worth \$28 more to unlock',
      'offer': 'Get 50% OFF for Combo',
    },
    {
      'code': 'WELCOME200',
      'description': 'Add items worth \$2 more to unlock',
      'offer': 'Get 50% OFF',
    },
  ];

  CouponsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13,vertical: 14),
                  child: CustomAppBar(text: 'My Coupons', text1: ''),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                  child: Text1(text1: 'Best Offers For You',size: 18,),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: coupons.length,
                    itemBuilder: (context, index) {
                      final coupon = coupons[index];
                      return CouponCard(
                        code: coupon['code']!,
                        description: coupon['description']!,
                        offer: coupon['offer']!,
                      );
                    },
                  ),
                ),

              ],

            )
        ));
  }
}

class CouponCard extends StatelessWidget {
  final String code;
  final String description;
  final String offer;

  const CouponCard(
      {super.key, required this.code, required this.description, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tabColor,
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              code,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.local_offer,
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  offer,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'COPY CODE', onTap: () {})
          ],
        ),
      ),
    );
  }
}
