import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_flutter/domain/models/autocomplete_search/autocomplete_model.dart';
import 'package:interview_flutter/domain/repositories/autocomplete_repositoy.dart';
import 'package:interview_flutter/shared/exeptions/custom_exeptions.dart';

part 'auto_complete_event.dart';
part 'auto_complete_state.dart';

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  final AutocompleteRepositoy autocompleteRepositoy;
  AutoCompleteBloc({required this.autocompleteRepositoy})
      : super(AutoCompleteState.initial()) {
    on<AutoCompleteSearchEvent>(autoCompleteSearchEvente);
  }

  Future<void> autoCompleteSearchEvente(
      AutoCompleteSearchEvent event, Emitter<AutoCompleteState> emit) async {
    emit(state.copyWith(autoCompleteStatus: AutoCompleteStatus.loading));

    final List<AutoCompleteModel> newList = [];
    try {
      final response = await autocompleteRepositoy.autoCompleteSearch(
          path: event.searchPath);
      newList.addAll(response);
      emit(
        state.copyWith(
          autoCompleteStatus: AutoCompleteStatus.succes,
          itemsList: newList,
        ),
      );
    } catch (e) {
      if (e is CustomException) {
        emit(state.copyWith(
            autoCompleteStatus: AutoCompleteStatus.error,
            errorMessage: e.message));
      } else {
        emit(state.copyWith(
            autoCompleteStatus: AutoCompleteStatus.error,
            errorMessage: 'An unexpected error occurred.'));
      }
    }
  }
}
