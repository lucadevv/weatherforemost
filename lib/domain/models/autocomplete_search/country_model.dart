import 'package:interview_flutter/data/datasources/entities/admistrative_entity.dart';

class CountryModel {
  final String id;
  final String localizedName;

  CountryModel({
    required this.id,
    required this.localizedName,
  });

  CountryModel copyWith({
    String? id,
    String? localizedName,
  }) =>
      CountryModel(
        id: id ?? this.id,
        localizedName: localizedName ?? this.localizedName,
      );

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["ID"],
        localizedName: json["LocalizedName"],
      );

  factory CountryModel.fromToEntityNtwDb(AdministrativeAreaEntity entity) {
    return CountryModel(
      id: entity.id,
      localizedName: entity.localizedName,
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
      };
}
