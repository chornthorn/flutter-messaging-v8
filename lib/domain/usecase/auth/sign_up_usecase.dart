import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/users/user_req_entity.dart';
import '../../entity/users/user_res_entity.dart';
import '../../repository/auth/auth.firebase.repository.dart';

class SignUpUseCase implements UseCase<UserResEntity, UserReqEntity> {
  final AuthFirebaseRepository _repository;

  SignUpUseCase({@required AuthFirebaseRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Future<Either<Failure, UserResEntity>> call(UserReqEntity params) async {
    return await _repository.registerWithEmailAndPassword(
        userReqEntity: params);
  }
}
