import '../../../domain/entity/users/user_res_entity.dart';

class UserResModel extends UserResEntity {
  UserResModel({
    this.uid,
    this.name,
    this.email,
  });

  String uid;
  String name;
  String email;

  factory UserResModel.fromJson(Map<String, dynamic> json) => UserResModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
      };
}
