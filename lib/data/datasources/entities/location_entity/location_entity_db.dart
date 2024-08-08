import 'package:interview_flutter/data/datasources/entities/location_entity/temperature_entity_db.dart';

class LocationEntityDb {
  final DateTime localObservationDateTime;
  final int epochTime;
  final String weatherText;
  final int weatherIcon;
  final bool hasPrecipitation;
  final dynamic precipitationType;
  final bool isDayTime;
  final TemperatureEntityDb temperature;
  final String mobileLink;
  final String link;

  LocationEntityDb({
    required this.localObservationDateTime,
    required this.epochTime,
    required this.weatherText,
    required this.weatherIcon,
    required this.hasPrecipitation,
    required this.precipitationType,
    required this.isDayTime,
    required this.temperature,
    required this.mobileLink,
    required this.link,
  });

  LocationEntityDb copyWith({
    DateTime? localObservationDateTime,
    int? epochTime,
    String? weatherText,
    int? weatherIcon,
    bool? hasPrecipitation,
    dynamic precipitationType,
    bool? isDayTime,
    TemperatureEntityDb? temperature,
    String? mobileLink,
    String? link,
  }) =>
      LocationEntityDb(
        localObservationDateTime:
            localObservationDateTime ?? this.localObservationDateTime,
        epochTime: epochTime ?? this.epochTime,
        weatherText: weatherText ?? this.weatherText,
        weatherIcon: weatherIcon ?? this.weatherIcon,
        hasPrecipitation: hasPrecipitation ?? this.hasPrecipitation,
        precipitationType: precipitationType ?? this.precipitationType,
        isDayTime: isDayTime ?? this.isDayTime,
        temperature: temperature ?? this.temperature,
        mobileLink: mobileLink ?? this.mobileLink,
        link: link ?? this.link,
      );

  factory LocationEntityDb.fromJson(Map<String, dynamic> json) =>
      LocationEntityDb(
        localObservationDateTime:
            DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"] ?? 0,
        weatherText: json["WeatherText"] ?? "",
        weatherIcon: json["WeatherIcon"] ?? 0,
        hasPrecipitation: json["HasPrecipitation"] ?? false,
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"] ?? false,
        temperature: TemperatureEntityDb.fromJson(json["Temperature"]),
        mobileLink: json["MobileLink"] ?? "",
        link: json["Link"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "LocalObservationDateTime": localObservationDateTime.toIso8601String(),
        "EpochTime": epochTime,
        "WeatherText": weatherText,
        "WeatherIcon": weatherIcon,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "IsDayTime": isDayTime,
        "TemperatureEntityDb": temperature.toJson(),
        "MobileLink": mobileLink,
        "Link": link,
      };
}
