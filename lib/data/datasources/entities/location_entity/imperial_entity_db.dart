class ImperialEntityDb {
  final double value;
  final String unit;
  final int unitType;

  ImperialEntityDb({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  ImperialEntityDb copyWith({
    double? value,
    String? unit,
    int? unitType,
  }) =>
      ImperialEntityDb(
        value: value ?? this.value,
        unit: unit ?? this.unit,
        unitType: unitType ?? this.unitType,
      );

  factory ImperialEntityDb.fromJson(Map<String, dynamic> json) =>
      ImperialEntityDb(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
      };
}
