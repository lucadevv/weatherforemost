import 'package:dio/dio.dart';
import 'package:interview_flutter/data/datasources/network/datasource_ntw_db.dart';
import 'package:interview_flutter/domain/models/location/location_model.dart';
import 'package:interview_flutter/domain/repositories/location_repository.dart';
import 'package:interview_flutter/shared/exeptions/error_handler.dart';

class LocationRepositoryImpl implements LocationRepository {
  final DatasourceNtwDb datasourceNtwDb;

  LocationRepositoryImpl({required this.datasourceNtwDb});
  @override
  Future<LocationModel> addCityLocation(
      {required String keyCity,
      required String nameCity,
      required String countryName,
      required String subtitle}) async {
    try {
      final response = await datasourceNtwDb.getLocationContidion(key: keyCity);
      final convert =
          LocationModel.fromEntity(response, nameCity, countryName, subtitle);

      return convert;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handle(e);
      }
      rethrow;
    }
  }
}
