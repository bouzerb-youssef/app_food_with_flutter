
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName= "/checkout";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>CheckoutScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"),),
      body: ElevatedButton(child: Text("Checkout Screen"),
      onPressed: (){
        Navigator.of(context).pop();

      },),
    );
  }
}