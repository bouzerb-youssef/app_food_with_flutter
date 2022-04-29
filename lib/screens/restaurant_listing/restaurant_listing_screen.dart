import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/models/models.dart';

import '../../widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = "/restaurantListing";
  final List<Restaurant> restaurants;

  const RestaurantListingScreen({Key? key, required this.restaurants})
      : super(key: key);
  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(
        restaurants: restaurants,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("RestaurantListing"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        /*  physics: NeverScrollableScrollPhysics(), */
        itemCount: restaurants.length,
        itemBuilder: ((context, index) {
          return RestaurantCard(
            restaurant: restaurants[index],
          );
        }),
      ),
    );
  }
}
