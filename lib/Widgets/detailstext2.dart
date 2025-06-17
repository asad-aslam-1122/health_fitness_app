import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class Text2 extends StatelessWidget {
  final String text2;
  final Color color;
  final double? size;
  const Text2({
    super.key, required this.text2,
    this.color=AppColors.text2Color, this.size=16
  });

  @override
  Widget build(BuildContext context) {
    return Text(text2,style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color

    ),
    );
  }
}