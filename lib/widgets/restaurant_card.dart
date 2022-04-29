import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/widgets/restaurant_tag.dart';

import '../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/restaurantDetails",
            arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: NetworkImage(restaurant.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('${restaurant.deliveryTime} min'))),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  /* Text("${restaurant.tags}" */
                  RestaurantTag(restaurant: restaurant),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "${restaurant.distance} km - \$${restaurant.deliveryFee}",
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
