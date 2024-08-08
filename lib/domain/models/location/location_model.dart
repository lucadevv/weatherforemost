import 'package:interview_flutter/data/datasources/entities/location_entity/location_entity_db.dart';
import 'package:interview_flutter/domain/models/location/temperature_model.dart';

class LocationModel {
  final DateTime localObservationDateTime;
  final int epochTime;
  final String weatherText;
  final int weatherIcon;
  final bool isDayTime;
  final String cityName;
  final String countryName;
  final String subtitle;
  final TemperatureModel temperature;

  LocationModel({
    required this.localObservationDateTime,
    required this.epochTime,
    required this.weatherText,
    required this.weatherIcon,
    required this.isDayTime,
    required this.temperature,
    required this.cityName,
    required this.countryName,
    required this.subtitle,
  });

  LocationModel copyWith({
    DateTime? localObservationDateTime,
    int? epochTime,
    String? weatherText,
    int? weatherIcon,
    bool? isDayTime,
    TemperatureModel? temperature,
    String? cityName,
    String? countryName,
    String? subtitle,
  }) =>
      LocationModel(
        localObservationDateTime:
            localObservationDateTime ?? this.localObservationDateTime,
        epochTime: epochTime ?? this.epochTime,
        weatherText: weatherText ?? this.weatherText,
        weatherIcon: weatherIcon ?? this.weatherIcon,
        isDayTime: isDayTime ?? this.isDayTime,
        temperature: temperature ?? this.temperature,
        cityName: cityName ?? this.cityName,
        countryName: countryName ?? this.countryName,
        subtitle: subtitle ?? this.subtitle,
      );
  factory LocationModel.fromEntity(
    LocationEntityDb entity,
    String cityName,
    String countryName,
    String subtitle,
  ) =>
      LocationModel(
        localObservationDateTime: entity.localObservationDateTime,
        epochTime: entity.epochTime,
        weatherText: entity.weatherText,
        weatherIcon: entity.weatherIcon,
        isDayTime: entity.isDayTime,
        temperature: TemperatureModel.fromEntity(entity.temperature),
        cityName: cityName,
        countryName: countryName,
        subtitle: subtitle,
      );
}
