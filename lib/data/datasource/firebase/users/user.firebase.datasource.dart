import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../../model/users/user_req_model.dart';

class UserFirebaseDatasource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createFirestoreUser({@required UserReqModel reqModel}) {
    return _db.doc('/ed_user_list/${reqModel.uid}').set(reqModel.toJson());
  }

  Future<void> updateFirestoreUser({@required UserReqModel reqModel}) {
    return _db.doc('/ed_user_list/${reqModel.uid}').update(reqModel.toJson());
  }

  Future<void> saveTokenToFirestore(
      {@required EDMobileRegisterTokenModel reqModel}) {
    return _db
        .doc('/ed_mobile_register_token_list/${reqModel.userId}')
        .set(reqModel.toJson());
  }
}
