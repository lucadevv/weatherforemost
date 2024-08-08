import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_flutter/domain/models/location/location_model.dart';
import 'package:interview_flutter/domain/repositories/location_repository.dart';
import 'package:interview_flutter/shared/exeptions/custom_exeptions.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;
  LocationBloc({required this.locationRepository})
      : super(LocationState.initial()) {
    on<AddLocationEvent>(addLocationEvent);
    on<RefreshLocationsEvent>(refreshLocationsEvent);
  }

  Future<void> addLocationEvent(
      AddLocationEvent event, Emitter<LocationState> emit) async {
    emit(state.copyWith(locationStatus: LocationStatus.loading));

    try {
      final response = await locationRepository.addCityLocation(
        keyCity: event.key,
        nameCity: event.cityName,
        countryName: event.countryName,
        subtitle: event.subtitle,
      );

      final updatedList = List<LocationModel>.from(state.itemList);
      // Verificar si el elemento ya existe en la lista
      final exists =
          updatedList.any((location) => location.cityName == response.cityName);

      if (!exists) {
        updatedList.add(response);

        emit(state.copyWith(
          locationStatus: LocationStatus.succes,
          itemList: updatedList,
        ));
      } else {
        emit(state.copyWith(
          locationStatus: LocationStatus.error,
          errorMessage: 'La ubicación ya existe.',
        ));
      }
    } catch (e) {
      if (e is CustomException) {
        emit(state.copyWith(
          locationStatus: LocationStatus.error,
        ));
      } else {
        emit(state.copyWith(locationStatus: LocationStatus.error));
      }
    }
  }

  Future<void> refreshLocationsEvent(
      RefreshLocationsEvent event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith());
    } catch (e) {
      if (e is CustomException) {
        emit(state.copyWith(
          locationStatus: LocationStatus.error,
        ));
      } else {
        emit(state.copyWith(locationStatus: LocationStatus.error));
      }
    }
  }
}
