import 'package:dartz/dartz.dart';
import '../../../imports.dart';


class SignInUseCase implements UseCase<Either, SignInUserReq> {
  @override
  Future<Either> call({SignInUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
