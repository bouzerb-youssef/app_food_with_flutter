import 'package:flutter/material.dart';

import '../models/restaurant_model.dart';

class RestaurantTag extends StatelessWidget {
  const RestaurantTag({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: restaurant.tags
            .map(
              (tag) =>
                  restaurant.tags.indexOf(tag) == restaurant.tags.length - 1
                      ? Text(tag, style: Theme.of(context).textTheme.headline6)
                      : Text("${tag},"),
            )
            .toList());
  }
}
