import 'package:interview_flutter/domain/models/location/location_model.dart';

abstract class LocationRepository {
  Future<LocationModel> addCityLocation({
    required String keyCity,
    required String nameCity,
    required String countryName,
    required String subtitle,
  });
}
