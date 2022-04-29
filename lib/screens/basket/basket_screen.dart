import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = "/basket";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => BasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Basket"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
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
                    Navigator.pushNamed(context, "/voucher");
                  },
                  child: Text("Go To Checkout"))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cutlery",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.secondary)),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text("do you need Cutlery?",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  SizedBox(
                    width: 100,
                    child: SwitchListTile(
                      dense: false,
                      value: false,
                      onChanged: (bool? newValue) {},
                    ),
                  )
                ],
              ),
            ),
            Text("Items",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.secondary)),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text("1x",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text("do you need Cutlery?",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Text("\$4.99",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  );
                }),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: SvgPicture.asset("assets/delivery.svg")),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Delivery in 20 minutes ",
                          style: Theme.of(context).textTheme.headline6),
                      TextButton(
                          onPressed: () {},
                          child: Text("Change",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )))
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have a voucher ?",
                          style: Theme.of(context).textTheme.headline6),
                      TextButton(
                          onPressed: () {},
                          child: Text("Apply",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )))
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: SvgPicture.asset("assets/voucher.svg")),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtatal",
                          style: Theme.of(context).textTheme.headline6),
                      Text("\$20.0",
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee",
                          style: Theme.of(context).textTheme.headline6),
                      Text("\$5.0",
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                      Text("\$25.0",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
