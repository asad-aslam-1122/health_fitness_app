import 'package:flutter/material.dart';
import 'package:gymfitnessapp/Constants/colors.dart';
import 'package:gymfitnessapp/Screens/Home/HomeWidget/reviewswidgetss.dart';
import 'package:gymfitnessapp/Screens/Home/Reviews/writeareviews.dart';
import 'package:gymfitnessapp/Widgets/custombtn.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  ReviewsScreenState createState() => ReviewsScreenState();
}

class ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'REVIEWS',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: const ReviewsSection(),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.bgColor,
        child: CustomButton(
            text: 'Write A Review',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const WriteReviewSection()));
            }),
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const ReviewssWidgetss(),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                '4.6',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 5; i++)
                    Icon(
                      i <= 4 ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 16,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                '174 Ratings',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const ReviewCard(
              name: 'Sharon Jem',
              rating: 4.8,
              date: '2d ago',
              content:
                  'Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.',
            ),
            const SizedBox(height: 16),
            const ReviewCard(
              name: 'Amy Gary',
              rating: 4.2,
              date: '3d ago',
              content:
                  'Maria has been amazing! 🤩 Joining his coaching has been transformational for me and she makes it so much fun to workout with her I’ve had several personal training experiences and this one is by far the best. Maria may very well be the best personal trainer in this app 😜',
            ),
            const SizedBox(height: 16),
            const ReviewCard(
              name: 'Phillip Amauro Lubin',
              rating: 3.6,
              date: '5d ago',
              content:
                  'I am not very satisfied with Maria. But app design is awesome. Should I be a designer 😉',
            ),
            const SizedBox(height: 16),
            const ReviewCard(
              name: 'Gretchen Schleifer',
              rating: 4.5,
              date: '1w ago',
              content: '',
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String content;

  const ReviewCard({
    super.key,
    required this.name,
    required this.rating,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/tr4.png'),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          '174',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      for (int i = 1; i <= 5; i++)
                        Icon(
                          i <= rating.toInt()
                              ? Icons.star
                              : i == rating.toInt() + 1 &&
                                      rating.toStringAsFixed(1) !=
                                          rating.toInt().toString()
                                  ? Icons.star_half
                                  : Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
