import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/errors/failure.dart';
import '../../../domain/entity/users/user_req_entity.dart';
import '../../../domain/repository/users/user.firebase.repository.dart';
import '../../datasource/firebase/users/user.firebase.datasource.dart';

class UserFirebaseService implements UserFirebaseRepository {
  final UserFirebaseDatasource _datasource;

  UserFirebaseService({@required UserFirebaseDatasource datasource})
      : assert(datasource != null),
        _datasource = datasource;

  @override
  Future<Either<Failure, void>> createFirestoreUser(
      {UserReqEntity userReqEntity}) async {
    try {
      final _r = await _datasource.createFirestoreUser(reqModel: userReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> updateFirestoreUser(
      {UserReqEntity userReqEntity}) async {
    try {
      final _r = await _datasource.updateFirestoreUser(reqModel: userReqEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> saveTokenToFirestore(
      {EDMobileRegisterTokenEntity entity}) async {
    try {
      final _r = await _datasource.saveTokenToFirestore(reqModel: entity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }
}
