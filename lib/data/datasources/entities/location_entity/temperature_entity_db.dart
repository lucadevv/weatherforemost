import 'package:interview_flutter/data/datasources/entities/location_entity/imperial_entity_db.dart';

class TemperatureEntityDb {
  final ImperialEntityDb metric;
  final ImperialEntityDb imperial;

  TemperatureEntityDb({
    required this.metric,
    required this.imperial,
  });

  TemperatureEntityDb copyWith({
    ImperialEntityDb? metric,
    ImperialEntityDb? imperial,
  }) =>
      TemperatureEntityDb(
        metric: metric ?? this.metric,
        imperial: imperial ?? this.imperial,
      );

  factory TemperatureEntityDb.fromJson(Map<String, dynamic> json) =>
      TemperatureEntityDb(
        metric: ImperialEntityDb.fromJson(json["Metric"]),
        imperial: ImperialEntityDb.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "ImperialEntityDb": imperial.toJson(),
      };
}
