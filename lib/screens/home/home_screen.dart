import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/models/models.dart';
import 'package:flutter_food_delevery/models/promo_model.dart';
import 'package:flutter_food_delevery/widgets/category_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/food_search_box.dart';
import '../../widgets/promo_box.dart';
import '../../widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(
                      category: Category.categories[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(
                      promo: Promo.promos[index],
                    );
                  },
                ),
              ),
            ),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Top Rated",
                      style: Theme.of(context).textTheme.headline4)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Restaurant.restaurants.length,
                    itemBuilder: ((context, index) {
                      return RestaurantCard(
                        restaurant: Restaurant.restaurants[index],
                      );
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CURRENT  LOCATIONs",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
            Text("Ait ourir, 1 qu igoudar elhaouz",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white)),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
