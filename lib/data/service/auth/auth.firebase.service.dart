import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entity/users/user_res_entity.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entity/users/user_req_entity.dart';
import '../../../domain/repository/auth/auth.firebase.repository.dart';
import '../../datasource/firebase/auth/auth.firebase.datasource.dart';

class AuthFirebaseService implements AuthFirebaseRepository {
  final AuthFirebaseDatasource _datasource;

  AuthFirebaseService({@required AuthFirebaseDatasource datasource})
      : assert(datasource != null),
        _datasource = datasource;

  @override
  Future<Either<Failure, UserResEntity>> registerWithEmailAndPassword(
      {UserReqEntity userReqEntity}) async {
    try {
      final _r = await _datasource.registerWithEmailAndPassword(
          userReqModel: userReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(
      {UserReqEntity userReqEntity}) async {
    try {
      final _r =
          await _datasource.sendPasswordResetEmail(userReqModel: userReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      {UserReqEntity userReqEntity}) async {
    try {
      final _r = await _datasource.signInWithEmailAndPassword(
          userReqModel: userReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final _r = await _datasource.signOut();
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }
}
