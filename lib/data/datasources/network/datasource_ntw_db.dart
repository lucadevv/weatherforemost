import 'package:dio/dio.dart';
import 'package:interview_flutter/data/datasources/entities/autocomplete_entity.dart';
import 'package:interview_flutter/data/datasources/entities/location_entity/location_entity_db.dart';

import 'package:interview_flutter/shared/exeptions/error_handler.dart';

class DatasourceNtwDb {
  final Dio dio;

  DatasourceNtwDb({required this.dio});
  Future<List<AutoCompleteEntity>> autoCompleteSearch(
      {required String path}) async {
    try {
      final response = await dio.get(
        "${const String.fromEnvironment("base-url")}/locations/v1/cities/autocomplete",
        queryParameters: {
          "apikey": const String.fromEnvironment('api-key'),
          "q": path,
          "language": "en",
        },
      );
      final List<dynamic> jsonData = response.data;
      final List<AutoCompleteEntity> btcModels = jsonData.map((json) {
        return AutoCompleteEntity.fromJson(json);
      }).toList();
      return btcModels;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handle(e);
      }
      rethrow;
    }
  }

  Future<LocationEntityDb> getLocationContidion({required String key}) async {
    try {
      final response = await dio.get(
        "${const String.fromEnvironment("base-url")}/currentconditions/v1/$key",
        queryParameters: {
          "apikey": const String.fromEnvironment('api-key'),
        },
      );

      final jsonData = response.data;

      // Aquí asumimos que jsonData es una lista con un solo objeto JSON
      final locationEntityDb = LocationEntityDb.fromJson(jsonData[0]);
      return locationEntityDb;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handle(e);
      }
      rethrow;
    }
  }
}
