import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repository/auth/auth.firebase.repository.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthFirebaseRepository _repository;

  SignOutUseCase({@required AuthFirebaseRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.signOut();
  }
}
