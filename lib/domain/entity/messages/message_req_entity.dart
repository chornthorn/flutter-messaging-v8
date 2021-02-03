import 'package:equatable/equatable.dart';
import '../../../data/model/messages/message_res.firebase.dart';

class MessageReqDataEntity extends MessageResFirebaseModel {
  String id;
  String userName;
  String messageTitle;
  String messageBody;

  MessageReqDataEntity({
    this.id,
    this.userName,
    this.messageTitle,
    this.messageBody,
  });

  @override
  List<Object> get props => [userName, id, messageTitle, messageBody];
}
