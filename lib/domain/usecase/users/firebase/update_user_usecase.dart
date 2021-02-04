import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../entity/users/user_req_entity.dart';
import '../../../repository/users/user.firebase.repository.dart';

class UpdateUserFirebaseUseCase implements UseCase<void, UserReqEntity> {
  final UserFirebaseRepository _repository;

  UpdateUserFirebaseUseCase({@required UserFirebaseRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Future<Either<Failure, void>> call(UserReqEntity params) async {
    return await _repository.updateFirestoreUser(userReqEntity: params);
  }
}
