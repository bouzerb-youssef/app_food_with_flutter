import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/autocomplete/autocomplete_bloc.dart';
import '../../blocs/geolocation/bloc/geolocation_bloc.dart';
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
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                  ));
                } else if (state is GeolocationLoaded) {
                  return Gmap(
                    lat: state.position.latitude,
                    lng: state.position.longitude,
                  );
                } else {
                  return Center(child: Text('yes yes '));
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
                  Expanded(
                      child: Column(
                    children: [
                      locationSearchBox(),
                      BlocBuilder<AutocompleteBloc, AutocompleteState>(
                        builder: (context, state) {
                          if (state is AutocompleteLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.red,
                            );
                          } else if (state is AutocompleteLoaded) {
                            return Container(
                                margin: const EdgeInsets.all(8),
                                height: 300,
                                color: state.autocomplete.isNotEmpty
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.transparent,
                                child: ListView.builder(
                                    itemCount: state.autocomplete.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                          title: Text(
                                              state.autocomplete[index]
                                                  .description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  )));
                                    }));
                          } else {
                            return const Center(
                              child: Text("does not work"),
                            );
                          }
                        },
                      )
                    ],
                  )),
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
