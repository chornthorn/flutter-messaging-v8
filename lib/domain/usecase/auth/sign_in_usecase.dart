import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entity/users/user_req_entity.dart';
import '../../repository/auth/auth.firebase.repository.dart';

class SignInUseCase implements UseCase<void, UserReqEntity> {
  final AuthFirebaseRepository _repository;

  SignInUseCase({@required AuthFirebaseRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Future<Either<Failure, void>> call(UserReqEntity params) async {
    return await _repository.signInWithEmailAndPassword(userReqEntity: params);
  }
}
