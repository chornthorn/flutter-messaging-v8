import 'package:equatable/equatable.dart';

class MessageResEntity extends Equatable {
  MessageResEntity({
    this.messageId,
    this.userName,
    this.moduleName,
    this.messageSubject,
    this.messageTitle,
    this.messageBody,
    this.messageStatus,
    this.createdDate,
    this.updatedDate,
    this.createdDateStr,
    this.updatedDateStr,
    this.dateShow,
    this.messageCircleAvatar,
  });

  String messageId;
  String userName;
  String moduleName;
  String messageSubject;
  String messageTitle;
  String messageBody;
  String messageStatus;
  String messageCircleAvatar;
  DateTime createdDate;
  DateTime updatedDate;
  String createdDateStr;
  String updatedDateStr;
  String dateShow;

  @override
  List<Object> get props => [
        messageId,
        userName,
        moduleName,
        messageSubject,
        messageTitle,
        messageBody,
        createdDate,
        updatedDate,
        createdDateStr,
        updatedDateStr,
        dateShow,
        messageCircleAvatar,
      ];
}
