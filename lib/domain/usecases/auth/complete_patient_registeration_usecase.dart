import 'package:dartz/dartz.dart';
import '../../../imports.dart';


class CompletePatientRegisterationUsecase implements UseCase<Either, CompletePatientRegisterationRequest> {
  @override
  Future<Either> call({CompletePatientRegisterationRequest? params}) {
    return sl<AuthRepository>().completePatientInfo(params!);
  }
}