import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SignInUserReq signInUserReq);

  Future<Either> register(CreateUserReq createUserReq);
  Future<Either> completeDoctorInfo(CompleteDoctorRegisterationRequest completeDrRegisterReq);

}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return Right('تم تسجيل الدخول بنجاح');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'البريد الإلكتروني غير صالح';
      } else if (e.code == 'wrong-password') {
        message = 'كلمة المرور غير صحيحة';
      }
      return left(message);
    }
  }

  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    try {
      // 1️⃣ تسجيل المستخدم بالـ Firebase Auth
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      // 2️⃣ إعداد بيانات Firestore حسب الدور
      Map<String, dynamic> userData;
      if (createUserReq.role == 'دكتور') {
        userData = createUserReq.doctorToMap();
      } else {
        userData = createUserReq.patientToMap();
      }

      // 3️⃣ حفظ البيانات في Firestore
      await FirebaseFirestore.instance
          .collection('se7ety_users')
          .doc(data.user?.uid)
          .set(userData);

      return Right('تم التسجيل بنجاح');
    } on FirebaseAuthException catch (e) {
      String message = 'أدخل بيانات';
      if (e.code == 'weak-password') {
        message = 'كلمة المرور ضعيفة';
      } else if (e.code == 'email-already-in-use') {
        message = 'المستخدم موجود مسبقا';
      } else if (e.code == 'invalid-email') {
        message = 'البريد الإلكتروني غير صالح';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> completeDoctorInfo(CompleteDoctorRegisterationRequest completeDrRegisterReq) async {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) return const Left('المستخدم غير موجود');

        await FirebaseFirestore.instance
            .collection('se7ety_users')
            .doc(user.uid)
            .set(completeDrRegisterReq.toMap(), SetOptions(merge: true)); // ✅ نستخدم toMap من الـ Request

        return const Right('تم إكمال البيانات بنجاح');
      } catch (e) {
        return Left('حدث خطأ: ${e.toString()}');
      }
  }

}
