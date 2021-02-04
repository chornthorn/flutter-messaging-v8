import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../entity/users/user_req_entity.dart';
import '../../../repository/users/user.firebase.repository.dart';

class SaveTokenUseCase implements UseCase<void, EDMobileRegisterTokenEntity> {
  final UserFirebaseRepository _repository;

  SaveTokenUseCase({@required UserFirebaseRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  Future<Either<Failure, void>> call(EDMobileRegisterTokenEntity params) async {
    return await _repository.saveTokenToFirestore(entity: params);
  }
}
