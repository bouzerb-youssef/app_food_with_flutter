import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delevery/blocs/filters/filters_bloc.dart';

import '../models/category_model.dart';

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategoryFilter({required this.categories, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is FiltersLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filter.categoryFilters[index].category.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                          value: state.filter.categoryFilters[index].value,
                          onChanged: (bool? newValue) {
                            context.read<FiltersBloc>().add(
                                  CategoryFilterUpdated(
                                    categoryFilter: state
                                        .filter.categoryFilters[index]
                                        .copyWith(
                                            value: !state.filter
                                                .categoryFilters[index].value),
                                  ),
                                );
                          }),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Text('Something went wrong.');
        }
      },
    ); /* ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categories[index].name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20,
                    child:
                        Checkbox(value: false, onChanged: (bool? newValue) {}),
                  )
                ]),
          );
        }));
  } */
  }
}
