import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/config/theme.dart';
import 'package:flutter_food_delevery/screens/home/home_screen.dart';
import 'package:flutter_food_delevery/screens/location/location_screen.dart';

import 'config/app_route.dart';
import 'package:flutter/foundation.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
/*     if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  } */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          title: 'FoodDelivery',
          debugShowCheckedModeBanner: false,
          theme: theme() ,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
    );
  }
}

