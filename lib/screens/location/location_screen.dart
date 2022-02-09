
import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/config/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName= "/location";

  static Route route(){
    return MaterialPageRoute(
      builder: (_)=>LocationScreen(),
      settings: RouteSettings(name: routeName),
      
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child:  const GoogleMap(
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(37.43296265331129, -122.08832357078792),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414),
              ),),
           Positioned(
            top: 40,
            left: 20,
            right: 20,                                                    

            child: Row(
              children: [
                SvgPicture.asset("assets/logo.svg",height: 50), 
                  SizedBox(
                      width: 10,
                    ),
                 Expanded(child: locationSearchBox()),
              ],
            )),
            Positioned(
            bottom: 40,
            left: 20,
            right: 20,                                                    

            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(onPressed: (){}, child: Text("Save"),
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor,),
            ))),
          

      ],),
    );
  }
}

// ignore: camel_case_types
class locationSearchBox extends StatelessWidget {
   const locationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter Your Location',
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),);
          }
}