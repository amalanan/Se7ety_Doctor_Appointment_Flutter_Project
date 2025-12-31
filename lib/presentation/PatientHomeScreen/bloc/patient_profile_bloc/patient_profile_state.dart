abstract class PatientProfileState {}

class PatientProfileLoading extends PatientProfileState {}

class PatientProfileLoaded extends PatientProfileState {
  final String name;
  final String city;
  final String bio;
  final String email;
  final String phone;
  final String imageUrl;

  PatientProfileLoaded({
    required this.name,
    required this.city,
    required this.bio,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });
}

class PatientProfileError extends PatientProfileState {
  final String message;
  PatientProfileError(this.message);
}
