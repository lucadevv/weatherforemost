import 'package:interview_flutter/data/datasources/entities/location_entity/temperature_entity_db.dart';
import 'package:interview_flutter/domain/models/location/imperial_model.dart';

class TemperatureModel {
  final ImperialModel metric;
  final ImperialModel imperial;

  TemperatureModel({
    required this.metric,
    required this.imperial,
  });

  TemperatureModel copyWith({
    ImperialModel? metric,
    ImperialModel? imperial,
  }) =>
      TemperatureModel(
        metric: metric ?? this.metric,
        imperial: imperial ?? this.imperial,
      );

  factory TemperatureModel.fromJson(Map<String, dynamic> json) =>
      TemperatureModel(
        metric: ImperialModel.fromJson(json["Metric"]),
        imperial: ImperialModel.fromJson(json["ImperialModel"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "ImperialModel": imperial.toJson(),
      };
  factory TemperatureModel.fromEntity(TemperatureEntityDb entity) =>
      TemperatureModel(
        metric: ImperialModel.fromEntity(entity.metric),
        imperial: ImperialModel.fromEntity(entity.imperial),
      );
}
