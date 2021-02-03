class UserResModel {
  UserResModel({
    this.uid,
    this.name,
    this.email,
  });

  int uid;
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
