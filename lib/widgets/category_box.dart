import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/models/models.dart';

import '../models/category_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = Restaurant.restaurants
        .where((restaurant) => restaurant.tags.contains(category.name))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/restaurantListing",
            arguments: restaurants);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Stack(
          children: [
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: category.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
