import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../domain/entity/messages/message_req_entity.dart';
import '../../../core/errors/failure.dart';
import '../../datasource/firebase/messages/message.firebase.datasource.dart';
import '../../../domain/entity/messages/message_res_entity.dart';
import '../../../domain/repository/messages/message.firebase.repository.dart';

class MessageFirebaseService implements MessageFirebaseRepository {

  final MessageFirebaseDatasource _firebaseDatasource;

  MessageFirebaseService(
      {@required MessageFirebaseDatasource firebaseDatasource})
      : assert(firebaseDatasource != null),
        _firebaseDatasource = firebaseDatasource;

  @override
  Stream<List<MessageResEntity>> get() {
    try {
      return _firebaseDatasource.getMessage();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure,void>> save({MessageReqDataEntity reqDataEntity}) async{
    try {
      final _r = await _firebaseDatasource.saveMessage(reqDataEntity);
      return Right(_r);
    } catch (e) {
      return Left(e);
    }
  }
}
