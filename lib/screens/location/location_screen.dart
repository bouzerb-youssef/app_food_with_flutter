import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delevery/blocs/geolocation/bloc/geolocation_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/gmap.dart';
import '../../widgets/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = "/location";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GeolocationLoaded) {
                  return Stack(
                    children: [
                      Gmap(
                        lat: state.position.latitude,
                        lng: state.position.longitude,
                      ),
                    ],
                  );
                } else {
                  return Text('Something went wrong!');
                }
              },
            ),
          ),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  SvgPicture.asset("assets/logo.svg", height: 50),
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Save"),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                  ))),
        ],
      ),
    );
  }
}
