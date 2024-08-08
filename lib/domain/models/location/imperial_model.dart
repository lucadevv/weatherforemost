import 'package:interview_flutter/data/datasources/entities/location_entity/imperial_entity_db.dart';

class ImperialModel {
  final double value;
  final String unit;
  final int unitType;

  ImperialModel({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  ImperialModel copyWith({
    double? value,
    String? unit,
    int? unitType,
  }) =>
      ImperialModel(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        unitType: unitType ?? this.unitType,
      );

  factory ImperialModel.fromJson(Map<String, dynamic> json) => ImperialModel(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
  factory ImperialModel.fromEntity(ImperialEntityDb entity) => ImperialModel(
        value: entity.value,
        unit: entity.unit,
        unitType: entity.unitType,
      );
}
