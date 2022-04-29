import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delevery/blocs/geolocation/bloc/geolocation_bloc.dart';
import 'package:flutter_food_delevery/config/theme.dart';
import 'package:flutter_food_delevery/repositories/geolocation/geolocation_repository.dart';
import 'package:flutter_food_delevery/screens/home/home_screen.dart';
import 'package:flutter_food_delevery/screens/location/location_screen.dart';
import 'package:flutter_food_delevery/screens/restaurant_details/restaurant_details_screen.dart';

import 'blocs/autocomplete/autocomplete_bloc.dart';
import 'blocs/filters/filters_bloc.dart';
import 'config/app_route.dart';
import 'repositories/places/places_repository.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
              create: (_) => GeolocationRepository()),
          RepositoryProvider<PlacesRepository>(
              create: (_) => PlacesRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GeolocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeolocation())),
            BlocProvider(
                create: (context) => AutocompleteBloc(
                    placesRepository: context.read<PlacesRepository>())
                  ..add(LoadAutocomplete())),
            /*
          BlocProvider(R
              create: (context) => PlaceBloc(
                  placesRepository: context.read<PlacesRepository>())),*/
            BlocProvider(create: (context) => FiltersBloc()..add(FilterLoad())),
          ],
          child: MaterialApp(
            title: 'FoodDelivery',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
            /*  initialRoute: RestaurantDetailsScreen.routeName, */
          ),
        ));
  }
}
