part of 'auto_complete_bloc.dart';

class AutoCompleteEvent extends Equatable {
  const AutoCompleteEvent();

  @override
  List<Object> get props => [];
}

class AutoCompleteSearchEvent extends AutoCompleteEvent {
  final String searchPath;

  const AutoCompleteSearchEvent({required this.searchPath});
  @override
  List<Object> get props => [searchPath];
}
