import 'package:dartz/dartz.dart';
import '../../../imports.dart';


class RegisterUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().register(params!);
  }
}