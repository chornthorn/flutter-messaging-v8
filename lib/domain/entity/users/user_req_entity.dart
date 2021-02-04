import '../../../data/model/users/user_req_model.dart';

class UserReqEntity extends UserReqModel {
  String uid;
  String password;
  String email;
  String name;
  UserReqEntity({this.password, this.email, this.uid, this.name});
}

class EDMobileRegisterTokenEntity extends EDMobileRegisterTokenModel {
  String tokenId;
  String userId;
  EDMobileRegisterTokenEntity({this.tokenId, this.userId});
}
