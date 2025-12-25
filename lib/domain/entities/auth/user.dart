class UserEntity {
  String? name;
  String? email;
  String? phone;
  String? role; // doctor / patient
  String? city;
  int? age;
  String? imageUrl;

  // بيانات خاصة بالدكتور فقط
  String? bio;
  String? specialization;
  String? clinicAddress;
  String? workingHoursFrom;
  String? workingHoursTo;

  UserEntity({
    this.name,
    this.email,
    this.phone,
    this.role,
    this.city,
    this.age,
    this.imageUrl,
    this.bio,
    this.specialization,
    this.clinicAddress,
    this.workingHoursFrom,
    this.workingHoursTo,
  });
}
