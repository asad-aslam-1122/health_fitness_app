import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/custombtn.dart';


class WriteReviewSection extends StatefulWidget {
  const WriteReviewSection({super.key});

  @override
  WriteReviewSectionState createState() => WriteReviewSectionState();
}

class WriteReviewSectionState extends State<WriteReviewSection> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'WRITE A REVIEWS',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Rating',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Slider(
                    activeColor: AppColors.buttonColor,
                    value: _rating,
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: _rating.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ),
                const Text(
                  '4.6',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Review (Optional)',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.tabColor,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            CustomButton(text: 'Send', onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const WriteReviewSection()));


            }),
          ],
        ),
      ),
    );
  }
}

