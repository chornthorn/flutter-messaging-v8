class MessageLocalModel {
  int id;
  String userName;
  String moduleName;
  String messageSubject;
  String messageTitle;
  String messageBody;
  String messageStatus;
  String messageCircleAvatar;
  DateTime createdDate;
  DateTime updatedDate;

  MessageLocalModel({
    this.userName,
    this.moduleName,
    this.messageSubject,
    this.messageTitle,
    this.messageBody,
    this.messageStatus,
    this.messageCircleAvatar,
    this.createdDate,
    this.updatedDate,
  });

  MessageLocalModel.withId({
    this.id,
    this.userName,
    this.moduleName,
    this.messageSubject,
    this.messageTitle,
    this.messageBody,
    this.messageStatus,
    this.messageCircleAvatar,
    this.createdDate,
    this.updatedDate,
  });

  Map<String, dynamic> toMap() {
    final data = Map<String, dynamic>();
    if (id != null) {
      data['id'] = id;
    }
    data['userName'] = this.userName;
    data['moduleName'] = this.moduleName;
    data['messageSubject'] = this.messageSubject;
    data['messageTitle'] = this.messageTitle;
    data['messageBody'] = this.messageBody;
    data['messageStatus'] = this.messageStatus;
    data['messageCircleAvatar'] = this.messageCircleAvatar;
    data['createdDate'] = this.createdDate.toIso8601String();
    data['updatedDate'] = this.updatedDate.toIso8601String();

    return data;
  }

  factory MessageLocalModel.fromMap(Map<String, dynamic> json) {
    return MessageLocalModel.withId(
      id: json['id'],
      userName: json['userName'],
      moduleName: json['moduleName'],
      messageSubject: json['messageSubject'],
      messageTitle: json['messageTitle'],
      messageBody: json['messageBody'],
      messageStatus: json['messageStatus'],
      messageCircleAvatar: json['messageCircleAvatar'],
      createdDate: DateTime.parse(json["createdDate"]),
      updatedDate: DateTime.parse(json["updatedDate"]),
    );
  }
}
