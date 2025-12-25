import 'package:dartz/dartz.dart';
import '../../../imports.dart';

abstract class AuthRepository {
  Future<Either> register(CreateUserReq createUserReq);

  Future<Either> signIn(SignInUserReq signInUserReq);

  Future<Either> completeDoctorInfo(
    CompleteDoctorRegisterationRequest completeDrRegisterReq,
  );
  Future<Either> completePatientInfo(
      CompletePatientRegisterationRequest completePatientRegisterReq,
      );
}
