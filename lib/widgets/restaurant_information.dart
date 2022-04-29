import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/widgets/restaurant_tag.dart';

import '../models/restaurant_model.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({required this.restaurant, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          RestaurantTag(restaurant: restaurant),
          SizedBox(height: 5),
          Text(
            '${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 5),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
