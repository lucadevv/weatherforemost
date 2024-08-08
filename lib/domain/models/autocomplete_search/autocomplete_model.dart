import 'package:interview_flutter/data/datasources/entities/autocomplete_entity.dart';
import 'package:interview_flutter/domain/models/autocomplete_search/country_model.dart';

class AutoCompleteModel {
  final String key;
  final String type;
  final int rank;
  final String localizedName;
  final CountryModel country;

  AutoCompleteModel({
    required this.key,
    required this.type,
    required this.rank,
    required this.localizedName,
    required this.country,
  });

  AutoCompleteModel copyWith({
    String? key,
    String? type,
    int? rank,
    String? localizedName,
    CountryModel? country,
  }) =>
      AutoCompleteModel(
        key: key ?? this.key,
        type: type ?? this.type,
        rank: rank ?? this.rank,
        localizedName: localizedName ?? this.localizedName,
        country: country ?? this.country,
      );

  factory AutoCompleteModel.fromJson(Map<String, dynamic> json) =>
      AutoCompleteModel(
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        country: CountryModel.fromJson(json["Country"]),
      );
  factory AutoCompleteModel.fromToEntityNtwDb(AutoCompleteEntity entity) {
    return AutoCompleteModel(
      key: entity.key,
      type: entity.type,
      rank: entity.rank,
      localizedName: entity.localizedName,
      country: CountryModel.fromToEntityNtwDb(entity.country),
    );
  }
  Map<String, dynamic> toJson() => {
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "Country": country.toJson(),
      };
}
