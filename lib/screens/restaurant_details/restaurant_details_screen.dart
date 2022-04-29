import 'package:flutter/material.dart';
import 'package:flutter_food_delevery/models/models.dart';

import '../../widgets/restaurant_information.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = "/restaurantDetails";
  final Restaurant restaurant;

  const RestaurantDetailsScreen({Key? key, required this.restaurant})
      : super(key: key);

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(
        restaurant: restaurant,
      ),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                        shape: const RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, "/basket");
                    },
                    child: Text("Basket"))
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 50)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          restaurant.imageUrl,
                        ))),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                },
              ),
            ],
          ),
        ));
  }
}

Widget _buildMenuItems(Restaurant restaurant, BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          restaurant.tags[index],
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
      Column(
        children: restaurant.menuItems
            .where((menuItem) => menuItem.category == restaurant.tags[index])
            .map((menuItem) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: Colors.white,
                      child: ListTile(
                        title: Text(menuItem.name,
                            style: Theme.of(context).textTheme.headline5),
                        subtitle: Text(menuItem.description,
                            style: Theme.of(context).textTheme.headline6),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${menuItem.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2.0,
                    )
                  ],
                ))
            .toList(),
      )
    ],
  );
}
