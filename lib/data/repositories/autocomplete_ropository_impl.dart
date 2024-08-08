import 'package:dio/dio.dart';
import 'package:interview_flutter/data/datasources/network/datasource_ntw_db.dart';
import 'package:interview_flutter/domain/models/autocomplete_search/autocomplete_model.dart';
import 'package:interview_flutter/domain/repositories/autocomplete_repositoy.dart';
import 'package:interview_flutter/shared/exeptions/error_handler.dart';

class AutocompleteRopositoryImpl extends AutocompleteRepositoy {
  final DatasourceNtwDb datasourceNtwDb;

  AutocompleteRopositoryImpl({required this.datasourceNtwDb});

  @override
  Future<List<AutoCompleteModel>> autoCompleteSearch(
      {required String path}) async {
    try {
      final response = await datasourceNtwDb.autoCompleteSearch(path: path);
      final list = response
          .map((item) => AutoCompleteModel.fromToEntityNtwDb(item))
          .toList();
      return list;
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handle(e);
      }
      rethrow;
    }
  }
}
