
import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName= "/deliveryTime";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeliveryTime"),),
      body: ElevatedButton(child: Text("DeliveryTime Screen"),
      onPressed: (){
        Navigator.of(context).pop();

      },),
    );
  }
}