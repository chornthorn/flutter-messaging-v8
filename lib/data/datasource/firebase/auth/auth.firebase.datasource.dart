import 'package:firebase_auth/firebase_auth.dart';
import '../../../model/users/user_res_model.dart';

import '../../../model/users/user_req_model.dart';

class AuthFirebaseDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserResModel> registerWithEmailAndPassword(
      {UserReqModel userReqModel}) async {
    return await _auth
        .createUserWithEmailAndPassword(
      email: userReqModel.email.trim(),
      password: userReqModel.password.trim(),
    )
        .then((value) async {
      var email = value.user.email;
      var uid = value.user.uid;
      var list = {
        "uid": uid,
        "name": userReqModel.name,
        "email": email,
      };
      return UserResModel.fromJson(list);
    });
  }

  Future<void> signInWithEmailAndPassword({UserReqModel userReqModel}) async {
    return await _auth.signInWithEmailAndPassword(
      email: userReqModel.email.trim(),
      password: userReqModel.password.trim(),
    );
  }

  Future<void> sendPasswordResetEmail({UserReqModel userReqModel}) async {
    return await _auth.sendPasswordResetEmail(email: userReqModel.email.trim());
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
