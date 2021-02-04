import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../entity/users/user_req_entity.dart';

abstract class UserFirebaseRepository {
  Future<Either<Failure, void>> createFirestoreUser(
      {UserReqEntity userReqEntity});

  Future<Either<Failure, void>> updateFirestoreUser(
      {UserReqEntity userReqEntity});

  Future<Either<Failure, void>> saveTokenToFirestore(
      {EDMobileRegisterTokenEntity entity});
}
