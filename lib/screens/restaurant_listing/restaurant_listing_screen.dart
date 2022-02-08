
import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName= "/restaurantListing";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>RestaurantListingScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RestaurantListing"),),
      body: ElevatedButton(child: Text("RestaurantListing Screen"),
      onPressed: (){
        Navigator.of(context).pop();

      },),
    );
  }
}