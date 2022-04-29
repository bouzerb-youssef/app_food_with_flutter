import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delevery/models/price_filter_model.dart';

import '../../models/category_filter_model.dart';
import '../../models/filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<FilterLoad>(_mapFilterLoadTOstate);
    on<CategoryFilterUpdated>(_mapCategoryFilterUpdatedTOstate);
    on<PriceFilterUpdated>(_mapPriceFilterUpdatedTOstate);
  }

  FutureOr<void> _mapFilterLoadTOstate(event, Emitter<FiltersState> emit) {
    emit(FiltersLoaded(
        filter: Filter(
      categoryFilters: CategoryFilter.filters,
      priceFilters: PriceFilter.filters,
    )));
  }

  FutureOr<void> _mapPriceFilterUpdatedTOstate(
      PriceFilterUpdated event, Emitter<FiltersState> emit) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();
      emit(FiltersLoaded(
        filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        ),
      ));
    }
  }

  FutureOr<void> _mapCategoryFilterUpdatedTOstate(
      CategoryFilterUpdated event, Emitter<FiltersState> emit) {
    final state = this.state;

    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      emit(FiltersLoaded(
        filter: Filter(
          categoryFilters: updatedCategoryFilters,
          priceFilters: state.filter.priceFilters,
        ),
      ));
    }
  }
}
 



/* void _LoadAutocomplete(
      LoadAutocomplete event, Emitter<AutocompleteState> emit) async {
    _placesSubscription?.cancel();

    final List<PlaceAutocomplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);

    emit(AutocompleteLoaded(autocomplete: autocomplete));
  } *
  FutureOr<void> _mapPriceFilterUpdatedTOstate(PriceFilterUpdated event, Emitter<FiltersState> emit) {
  }

  FutureOr<void> _mapPriceFilterUpdatedTOstate(PriceFilterUpdated event, Emitter<FiltersState> emit) {
  }
*/