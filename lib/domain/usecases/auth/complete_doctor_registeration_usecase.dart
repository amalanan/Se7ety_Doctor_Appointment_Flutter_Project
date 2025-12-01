import 'package:dartz/dartz.dart';
import '../../../imports.dart';


class CompleteDoctorRegisterationUsecase implements UseCase<Either, CompleteDoctorRegisterationRequest> {
  @override
  Future<Either> call({CompleteDoctorRegisterationRequest? params}) {
    return sl<AuthRepository>().completeDoctorInfo(params!);
  }
}