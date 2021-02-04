class UserReqModel {
  UserReqModel({this.password, this.email, this.uid, this.name});

  String uid;
  String password;
  String email;
  String name;

  factory UserReqModel.fromJson(Map<String, dynamic> json) => UserReqModel(
        uid: json["uid"],
        password: json["password"],
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}

class EDMobileRegisterTokenModel {
  EDMobileRegisterTokenModel({this.tokenId, this.userId});

  String tokenId;
  String userId;

  factory EDMobileRegisterTokenModel.fromJson(Map<String, dynamic> json) =>
      EDMobileRegisterTokenModel(
        tokenId: json["tokenId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "userId": userId,
      };
}
