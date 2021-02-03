import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/entity/messages/message_res_entity.dart';

class MessageResFirebaseModel extends MessageResEntity {
  MessageResFirebaseModel({
    this.id,
    this.messageTitle,
    this.messageBody,
  });

  String id;
  String messageTitle;
  String messageBody;

  factory MessageResFirebaseModel.fromJson(DocumentSnapshot snapshot) => MessageResFirebaseModel(
    id: snapshot.id,
    messageTitle: snapshot["messageTitle"],
    messageBody: snapshot["messageBody"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "messageTitle": messageTitle,
    "messageBody": messageBody,
  };
}