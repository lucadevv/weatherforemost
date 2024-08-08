import 'package:interview_flutter/data/datasources/entities/admistrative_entity.dart';

class AutoCompleteEntity {
  final int version;
  final String key;
  final String type;
  final int rank;
  final String localizedName;
  final AdministrativeAreaEntity country;
  final AdministrativeAreaEntity administrativeArea;

  AutoCompleteEntity({
    required this.version,
    required this.key,
    required this.type,
    required this.rank,
    required this.localizedName,
    required this.country,
    required this.administrativeArea,
  });

  AutoCompleteEntity copyWith({
    int? version,
    String? key,
    String? type,
    int? rank,
    String? localizedName,
    AdministrativeAreaEntity? country,
    AdministrativeAreaEntity? administrativeArea,
  }) =>
      AutoCompleteEntity(
        version: version ?? this.version,
        key: key ?? this.key,
        type: type ?? this.type,
        rank: rank ?? this.rank,
        localizedName: localizedName ?? this.localizedName,
        country: country ?? this.country,
        administrativeArea: administrativeArea ?? this.administrativeArea,
      );

  factory AutoCompleteEntity.fromJson(Map<String, dynamic> json) =>
      AutoCompleteEntity(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        country: AdministrativeAreaEntity.fromJson(json["Country"]),
        administrativeArea:
            AdministrativeAreaEntity.fromJson(json["AdministrativeArea"]),
      );

  Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "Country": country.toJson(),
        "AdministrativeArea": administrativeArea.toJson(),
      };
}
