import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delevery/repositories/places/places_repository.dart';

import '../../models/place_autocomplete_model.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;
  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_LoadAutocomplete);
  }

  void _LoadAutocomplete(
      LoadAutocomplete event, Emitter<AutocompleteState> emit) async {
    _placesSubscription?.cancel();

    final List<PlaceAutocomplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);

    emit(AutocompleteLoaded(autocomplete: autocomplete));
  }

/*   @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  } */
}
