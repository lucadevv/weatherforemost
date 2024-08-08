part of 'location_bloc.dart';

enum LocationStatus { initial, loading, succes, error }

class LocationState extends Equatable {
  final List<LocationModel> itemList;
  final LocationStatus locationStatus;
  final String errorMessage;
  const LocationState({
    required this.itemList,
    required this.locationStatus,
    required this.errorMessage,
  });
  LocationState copyWith({
    List<LocationModel>? itemList,
    LocationStatus? locationStatus,
    String? errorMessage,
  }) =>
      LocationState(
        itemList: itemList ?? this.itemList,
        locationStatus: locationStatus ?? this.locationStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );
  factory LocationState.initial() => const LocationState(
        itemList: [],
        locationStatus: LocationStatus.initial,
        errorMessage: '',
      );
  @override
  List<Object> get props => [itemList, locationStatus, errorMessage];
}
