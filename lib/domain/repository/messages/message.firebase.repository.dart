import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../entity/messages/message_req_entity.dart';

import '../../entity/messages/message_res_entity.dart';

abstract class MessageFirebaseRepository {
  Stream<List<MessageResEntity>> get();
  Future<Either<Failure,void>> save({MessageReqDataEntity reqDataEntity});
}