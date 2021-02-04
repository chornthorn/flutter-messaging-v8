import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failure.dart';
import '../../../../domain/entity/users/user_req_entity.dart';
import '../../../../domain/usecase/users/firebase/create_user_usecase.dart';
import '../../../../domain/usecase/users/firebase/save_token_usecase.dart';
import '../../../../domain/usecase/users/firebase/update_user_usecase.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final CreateUserFirebaseUseCase _createUserFirebaseUseCase;
  final UpdateUserFirebaseUseCase _updateUserFirebaseUseCase;
  final SaveTokenUseCase _saveTokenUseCase;

  UserController({
    @required CreateUserFirebaseUseCase createUserFirebaseUseCase,
    @required UpdateUserFirebaseUseCase updateUserFirebaseUseCase,
    @required SaveTokenUseCase saveTokenUseCase,
  })  : assert(createUserFirebaseUseCase != null),
        assert(updateUserFirebaseUseCase != null),
        assert(saveTokenUseCase != null),
        _createUserFirebaseUseCase = createUserFirebaseUseCase,
        _saveTokenUseCase = saveTokenUseCase,
        _updateUserFirebaseUseCase = updateUserFirebaseUseCase;

  RxBool _isLoading = false.obs;

  bool get isLoading => this._isLoading.value;

  @override
  void onInit() {
    // _getToken();
    super.onInit();
  }

  _getToken() async {
    String token = await FirebaseMessaging.instance.getToken();
    print("Mobile token is $token");
  }

  createUserWithEmailAndPassword({UserReqEntity userReqEntity}) async {
    String token = await FirebaseMessaging.instance.getToken();
    print("Token is user controller $token");
    EDMobileRegisterTokenEntity _registerTokenEntity =
        EDMobileRegisterTokenEntity();
    _registerTokenEntity.userId = userReqEntity.uid;
    _registerTokenEntity.tokenId = token;
    _isLoading.value = true;
    final result = await _createUserFirebaseUseCase(userReqEntity);
    // saveMobileToken(userId: userReqEntity.uid, tokeId: token);
    _eitherRegisterFailureOrSuccess(result);
    _saveTokenUseCase(_registerTokenEntity);
    _isLoading.value = false;
  }

  saveMobileToken({String tokeId, String userId}) async {
    EDMobileRegisterTokenEntity _registerTokenEntity =
        EDMobileRegisterTokenEntity();
    _registerTokenEntity.userId = userId;
    _registerTokenEntity.tokenId = tokeId;
    _isLoading.value = true;
    final result = await _saveTokenUseCase(_registerTokenEntity);
    _eitherRegisterFailureOrSuccess(result);
    _isLoading.value = false;
  }

  void _eitherRegisterFailureOrSuccess(Either<Failure, void> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
      //_userResEntity.value = value;
      _buildAlertDialog(
        title: 'Message!',
        color: Colors.green,
        message: 'Successfully!',
      );
    });
  }

  // custom alert dialog
  void _buildAlertDialog({
    String title,
    String message,
    Color color,
  }) {
    Get.snackbar(
      '$title',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
    );
  }
}
