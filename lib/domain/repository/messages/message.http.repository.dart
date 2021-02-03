import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../entity/messages/message_res_entity.dart';

abstract class MessageHttpRepository {
  Future<Either<Failure, List<MessageResEntity>>> read();
}