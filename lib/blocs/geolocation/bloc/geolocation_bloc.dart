import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../repositories/geolocation/geolocation_repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeolocation>(_onLoadGeolocation);
    on<UpdateGeolocation>(_onUpdateGeolocation);
  }
  FutureOr<void> _onLoadGeolocation(
      LoadGeolocation event, Emitter<GeolocationState> emit) async {
    _geolocationSubscription?.cancel();

    final Position position = await _geolocationRepository.getCurrentLocation();

    add(UpdateGeolocation(position: position));
  }

  FutureOr<void> _onUpdateGeolocation(
      UpdateGeolocation event, Emitter<GeolocationState> emit) async {
    emit(GeolocationLoaded(position: event.position));
  }

  /* Stream<GeolocationState> mapEventToState(
    GeolocationEvent event,
  ) async* {
    if (event is LoadGeolocation) {
      yield* _mapLoadGeolocationToState();
    } else if (event is UpdateGeolocation) {
      yield* _mapUpdateGeolocationToState(event);
    }
  }

  Stream<GeolocationState> _mapLoadGeolocationToState() async* {
    _geolocationSubscription?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();

    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeolocationToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  */
}
