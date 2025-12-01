class CompletePatientRegisterationRequest {
  final String bio;
  final String phone;
  final int age;
  final String city;
  final String imageUrl;

  CompletePatientRegisterationRequest({
    required this.bio,
    required this.phone,
    required this.age,
    required this.city,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'phone': phone,
      'age': age,
      'city': city,
      'imageUrl': imageUrl,
    };
  }
}
