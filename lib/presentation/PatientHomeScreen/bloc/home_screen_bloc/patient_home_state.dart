abstract class PatientHomeState {}

class PatientHomeInitial extends PatientHomeState {}


class PatientHomeLoaded extends PatientHomeState {
  final String userName;
  final int currentIndex;

  PatientHomeLoaded({required this.userName, required this.currentIndex});

  PatientHomeLoaded copyWith({String? userName, int? currentIndex}) {
    return PatientHomeLoaded(
      userName: userName ?? this.userName,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class PatientHomeError extends PatientHomeState {
  final String message;

  PatientHomeError(this.message);
}
