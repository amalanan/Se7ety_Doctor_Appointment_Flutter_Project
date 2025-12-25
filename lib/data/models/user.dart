import '../../domain/entities/auth/user.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? role; // doctor / patient

  // ---------- مشتركة ----------
  String? city;
  int? age;
  String? imageUrl; // صورة المستخدم

  // ---------- خاصة بالدكتور ----------
  String? bio; // نبذة تعريفية
  String? specialization; // التخصص
  String? clinicAddress; // عنوان العيادة
  String? workingHoursFrom; // ساعات العمل من
  String? workingHoursTo; // ساعات العمل إلى

  UserModel({
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

  // تحويل من Firestore JSON إلى UserModel
  UserModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    role = data['role'];
    city = data['city'];
    age = data['age'];
    imageUrl = data['imageUrl'];
    bio = data['bio'];
    specialization = data['specialization'];
    clinicAddress = data['clinicAddress'];
    workingHoursFrom = data['workingHoursFrom'];
    workingHoursTo = data['workingHoursTo'];
  }

  // تحويل من UserModel إلى JSON لحفظه في Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'city': city,
      'age': age,
      'imageUrl': imageUrl,
      'bio': bio,
      'specialization': specialization,
      'clinicAddress': clinicAddress,
      'workingHoursFrom': workingHoursFrom,
      'workingHoursTo': workingHoursTo,
      'app': 'se7ety', // لتحديد التطبيق
    };
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      phone: phone,
      role: role,
      city: city,
      age: age,
      imageUrl: imageUrl,
      bio: bio,
      specialization: specialization,
      clinicAddress: clinicAddress,
      workingHoursFrom: workingHoursFrom,
      workingHoursTo: workingHoursTo,
    );
  }
}
