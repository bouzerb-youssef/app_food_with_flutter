import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delevery/blocs/filters/filters_bloc.dart';
import 'package:flutter_food_delevery/models/models.dart';

import '../../models/Price_model.dart';
import '../../models/category_model.dart';
import '../../widgets/custom_category_filter.dart';
import '../../widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filters";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Filter"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<FiltersBloc, FiltersState>(
                  builder: (context, state) {
                    if (state is FiltersLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is FiltersLoaded) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.secondary,
                              shape: const RoundedRectangleBorder(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              )),
                          onPressed: () {
                            var categories = state.filter.categoryFilters
                                .where((filter) => filter.value)
                                .map((filter) => filter.category.name)
                                .toList();
                            print(categories);
                            var prices = state.filter.priceFilters
                                .where((filter) => filter.value)
                                .map((filter) => filter.price.price)
                                .toList();
                            print(prices);
                            List<Restaurant> restaurants = Restaurant
                                .restaurants
                                .where((restaurant) => categories.any(
                                    (category) =>
                                        restaurant.tags.contains(category)))
                                .where((restaurant) => prices.any((price) =>
                                    restaurant.priceCategory.contains(price)))
                                .toList();
                            Navigator.pushNamed(context, "/restaurantListing",
                                arguments: restaurants);
                          },
                          child: Text("Apply"));
                    } else {
                      return Text('Something went wrong.');
                    }
                  },
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              CustomPriceFilter(prices: Price.prices),
              Text(
                "Categorys",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              CustomCategoryFilter(categories: Category.categories),
            ],
          ),
        ));
  }
}
