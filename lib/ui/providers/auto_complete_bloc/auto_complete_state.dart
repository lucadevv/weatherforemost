part of 'auto_complete_bloc.dart';

enum AutoCompleteStatus { initial, loading, succes, error }

class AutoCompleteState extends Equatable {
  final List<AutoCompleteModel> itemsList;
  final AutoCompleteStatus autoCompleteStatus;
  final String errorMessage;
  const AutoCompleteState({
    required this.itemsList,
    required this.autoCompleteStatus,
    required this.errorMessage,
  });

  AutoCompleteState copyWith({
    List<AutoCompleteModel>? itemsList,
    AutoCompleteStatus? autoCompleteStatus,
    String? errorMessage,
  }) =>
      AutoCompleteState(
        itemsList: itemsList ?? this.itemsList,
        autoCompleteStatus: autoCompleteStatus ?? this.autoCompleteStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  factory AutoCompleteState.initial() => const AutoCompleteState(
        itemsList: [],
        autoCompleteStatus: AutoCompleteStatus.initial,
        errorMessage: '',
      );

  @override
  List<Object> get props => [itemsList, autoCompleteStatus];
}
