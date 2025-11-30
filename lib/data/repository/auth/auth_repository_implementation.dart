import 'package:dartz/dartz.dart';

import '../../../imports.dart';


class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signInUserReq);
  }

  @override
  Future<Either> register(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().register(createUserReq);
  }

}
