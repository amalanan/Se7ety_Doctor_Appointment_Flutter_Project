class CreateUserReq {
  final String name;
  final String email;
  final String password;
  final String role;

  CreateUserReq({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> doctorToMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'phone': '',
      'city': '',
      'age': 0,
      'imageUrl': null,
      'bio': null,
      'specialization': null,
      'clinicAddress': null,
      'workingHoursFrom': null,
      'workingHoursTo': null,
    };
  }
  Map<String, dynamic> patientToMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'phone': '',
      'city': '',
      'age': 0,
      'imageUrl': null,
      'bio': null,
    };
  }
}
