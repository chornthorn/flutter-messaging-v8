import 'package:dartz/dartz.dart';
import '../../entity/users/user_res_entity.dart';

import '../../../core/errors/failure.dart';
import '../../entity/users/user_req_entity.dart';

abstract class AuthFirebaseRepository {
  Future<Either<Failure, UserResEntity>> registerWithEmailAndPassword(
      {UserReqEntity userReqEntity});

  Future<Either<Failure, void>> signInWithEmailAndPassword(
      {UserReqEntity userReqEntity});

  Future<Either<Failure, void>> sendPasswordResetEmail(
      {UserReqEntity userReqEntity});

  Future<Either<Failure, void>> signOut();
}
