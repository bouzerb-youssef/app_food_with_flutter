part of 'filters_bloc.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends FiltersEvent {
  @override
  List<Object> get props => [];
}

class PriceFilterUpdated extends FiltersEvent {
  final PriceFilter priceFilter;

  const PriceFilterUpdated({required this.priceFilter});
  @override
  List<Object> get props => [priceFilter];
}

class CategoryFilterUpdated extends FiltersEvent {
  final CategoryFilter categoryFilter;

  const CategoryFilterUpdated({required this.categoryFilter});
  @override
  List<Object> get props => [categoryFilter];
}
