import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delevery/blocs/geolocation/bloc/geolocation_bloc.dart';
import 'package:flutter_food_delevery/config/theme.dart';
import 'package:flutter_food_delevery/repositories/geolocation/geolocation_repository.dart';
import 'package:flutter_food_delevery/screens/home/home_screen.dart';

import 'config/app_route.dart';

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
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
              create: (_) => GeolocationRepository())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GeolocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeolocation())),
            /* BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutocomplete())),
          BlocProvider(
              create: (context) => PlaceBloc(
                  placesRepository: context.read<PlacesRepository>())),
          BlocProvider(create: (context) => FilterBloc()..add(FilterLoad())), */
          ],
          child: MaterialApp(
            title: 'FoodDelivery',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
          ),
        ));
  }
}
