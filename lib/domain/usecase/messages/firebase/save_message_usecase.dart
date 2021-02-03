import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../entity/messages/message_req_entity.dart';
import '../../../repository/messages/message.firebase.repository.dart';

class SaveMessageFirebaseUseCase
    implements UseCase<void, MessageReqDataEntity> {
  final MessageFirebaseRepository _repository;

  SaveMessageFirebaseUseCase({@required MessageFirebaseRepository firebase})
      : assert(firebase != null),
        _repository = firebase;

  @override
  Future<Either<Failure, void>> call(MessageReqDataEntity reqDataEntity) {
    return _repository.save(reqDataEntity: reqDataEntity);
  }

}