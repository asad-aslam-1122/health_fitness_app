import 'package:flutter/material.dart';

import '../../../Widgets/detailstext1.dart';

class CategoriesColumn extends StatelessWidget {
  final String image;
  final String text;
  const CategoriesColumn({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha((0.2 * 255).toInt()),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                image,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text1(
            text1: text,
            size: 13,
          )
        ],
      ),
    );
  }
}
