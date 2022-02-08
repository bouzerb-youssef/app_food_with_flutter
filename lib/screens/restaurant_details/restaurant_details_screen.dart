
import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName= "/restaurantDetails";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>RestaurantDetailsScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RestaurantDetails"),),
      body: ElevatedButton(child: Text("RestaurantDetails Screen"),
      onPressed: (){
        Navigator.of(context).pop();

      },),
    );
  }
}