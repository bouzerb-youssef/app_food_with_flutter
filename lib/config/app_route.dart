import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/models/models.dart';
import 'package:flutter_food_delevery/screens/home/home_screen.dart';
import 'package:flutter_food_delevery/screens/location/location_screen.dart';
import 'package:flutter_food_delevery/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("the route is : ${settings.name}");

    switch (settings.name) {
      case "/":
        return HomeScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();

      case FilterScreen.routeName:
        return FilterScreen.route();

      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);

      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);

      case VoucherScreen.routeName:
        return VoucherScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }
}

Route _errorRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
    ),
    settings: RouteSettings(name: "/error"),
  );
}
