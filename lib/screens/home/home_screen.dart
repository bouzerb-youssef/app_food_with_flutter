



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName= "/";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>HomeScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home"),),
      body:Center(
       child: Column(
         children: [
           SvgPicture.asset("assets/logo.svg"),
           ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Text("location Screen"),
          onPressed: (){
            Navigator.pushNamed(context, "/location");

          },)

         ],
       ),/*  */
      ) ,
    );
  }
}