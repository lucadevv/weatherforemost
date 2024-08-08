part of 'location_bloc.dart';

class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class FecthAllEvent extends LocationEvent {}

class AddLocationEvent extends LocationEvent {
  final String key;
  final String cityName;
  final String countryName;
  final String subtitle;

  const AddLocationEvent({
    required this.key,
    required this.cityName,
    required this.countryName,
    required this.subtitle,
  });

  @override
  List<Object> get props => [key, cityName, countryName, subtitle];
}

class RefreshLocationsEvent extends LocationEvent {}
