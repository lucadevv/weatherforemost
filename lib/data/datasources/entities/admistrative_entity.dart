class AdministrativeAreaEntity {
  final String id;
  final String localizedName;

  AdministrativeAreaEntity({
    required this.id,
    required this.localizedName,
  });

  AdministrativeAreaEntity copyWith({
    String? id,
    String? localizedName,
  }) =>
      AdministrativeAreaEntity(
        id: id ?? this.id,
        localizedName: localizedName ?? this.localizedName,
      );

  factory AdministrativeAreaEntity.fromJson(Map<String, dynamic> json) =>
      AdministrativeAreaEntity(
        id: json["ID"],
        localizedName: json["LocalizedName"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
      };
}
