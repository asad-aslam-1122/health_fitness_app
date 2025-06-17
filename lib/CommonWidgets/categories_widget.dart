import 'package:flutter/cupertino.dart';

import 'categories_column.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoriesColumn(image: 'images/fruites.png', text: 'Fruites'),
          CategoriesColumn(image: 'images/milk.png', text: 'Milk'),
          CategoriesColumn(image: 'images/beverages.png', text: 'Beverage'),
          CategoriesColumn(image: 'images/laundary.png', text: 'Laundary'),
          CategoriesColumn(image: 'images/vegetables.png', text: 'Vegetables'),
          CategoriesColumn(image: 'images/chicken.png', text: 'Chicken'),
          CategoriesColumn(image: 'images/meat.png', text: 'Meat'),



        ],

      ),


    );
  }
}
