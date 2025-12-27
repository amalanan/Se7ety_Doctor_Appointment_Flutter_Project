import '../../../../data/models/user.dart';

abstract class SearchScreenState {}

class SearchInitial extends SearchScreenState {}

class SearchLoading extends SearchScreenState {}

class SearchLoaded extends SearchScreenState {
  final List<UserModel> results;

  SearchLoaded(this.results);
}

class SearchError extends SearchScreenState {
  final String message;

  SearchError(this.message);
}
