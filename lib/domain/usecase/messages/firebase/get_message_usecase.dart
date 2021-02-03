import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../entity/messages/message_res_entity.dart';
import '../../../repository/messages/message.firebase.repository.dart';

class GetMessageFirebaseUseCase
    implements UseCaseStream<List<MessageResEntity>, NoParams> {
  final MessageFirebaseRepository _repository;

  GetMessageFirebaseUseCase({@required MessageFirebaseRepository firebase})
      : assert(firebase != null),
        _repository = firebase;

  @override
  Stream<List<MessageResEntity>> call(
      NoParams noParams)   {
    return  _repository.get();
  }
}
