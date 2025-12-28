abstract class PatientHomeState {}

class PatientHomeInitial extends PatientHomeState {}


class PatientHomeLoaded  extends PatientHomeState {
  final int currentIndex;
  final String searchQuery;
  final String userName;

  PatientHomeLoaded({
    required this.currentIndex,
    required this.searchQuery,
    required this.userName,
  });

  PatientHomeLoaded copyWith({
    int? currentIndex,
    String? searchQuery,
    String? userName,
  }) {
    return PatientHomeLoaded(
      currentIndex: currentIndex ?? this.currentIndex,
      searchQuery: searchQuery ?? this.searchQuery,
      userName: userName ?? this.userName,
    );
  }
}

class PatientHomeError extends PatientHomeState {
  final String message;

  PatientHomeError(this.message);
}