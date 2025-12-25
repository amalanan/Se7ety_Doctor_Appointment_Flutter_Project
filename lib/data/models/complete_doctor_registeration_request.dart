class CompleteDoctorRegisterationRequest {
  final String bio;
  final String phone;
  final String clinicAddress;
  final String specialization;
  final String workingHoursFrom;
  final String workingHoursTo;
  final int age;
  final String city;
  final String imageUrl;

  CompleteDoctorRegisterationRequest({
    required this.bio,
    required this.phone,
    required this.clinicAddress,
    required this.specialization,
    required this.workingHoursFrom,
    required this.workingHoursTo,
    required this.age,
    required this.city,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'phone': phone,
      'clinicAddress': clinicAddress,
      'specialization': specialization,
      'workingHoursFrom': workingHoursFrom,
      'workingHoursTo': workingHoursTo,
      'age': age,
      'city': city,
      'imageUrl': imageUrl,
    };
  }
}
