import 'package:interview_flutter/domain/models/autocomplete_search/autocomplete_model.dart';

abstract class AutocompleteRepositoy {
  Future<List<AutoCompleteModel>> autoCompleteSearch({required String path});
}
