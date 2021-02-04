import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../domain/entity/users/user_req_entity.dart';
import '../../../../domain/entity/users/user_res_entity.dart';
import '../../../../domain/usecase/auth/reset_password_usecase.dart';
import '../../../../domain/usecase/auth/sign_in_usecase.dart';
import '../../../../domain/usecase/auth/sign_out_usecase.dart';
import '../../../../domain/usecase/auth/sign_up_usecase.dart';
import 'package:get/get.dart';

import 'user.controller.dart';

class AuthController extends GetxController {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthController({
    @required SignUpUseCase signUpUseCase,
    @required SignInUseCase signInUseCase,
    @required ResetPasswordUseCase resetPasswordUseCase,
    @required SignOutUseCase signOutUseCase,
  })  : assert(signUpUseCase != null),
        assert(signInUseCase != null),
        assert(resetPasswordUseCase != null),
        assert(signOutUseCase != null),
        _signUpUseCase = signUpUseCase,
        _signInUseCase = signInUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _signOutUseCase = signOutUseCase;

  RxBool _isLoading = false.obs;

  bool get isLoading => this._isLoading.value;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<UserResEntity> _userResEntity = UserResEntity().obs;
  UserResEntity get userResEntity => this._userResEntity.value;

  signInWithEmailAndPassword() async {
    UserReqEntity reqDataEntity = UserReqEntity();
    reqDataEntity.email = emailController.text;
    reqDataEntity.password = passwordController.text;

    _isLoading.value = true;
    final result = await _signInUseCase(reqDataEntity);
    _eitherAuthFailureOrSuccess(result);
    _isLoading.value = false;
  }

  registerWithEmailAndPassword() async {
    UserReqEntity reqDataEntity = UserReqEntity();
    reqDataEntity.email = emailController.text;
    reqDataEntity.name = nameController.text;
    reqDataEntity.password = passwordController.text;

    _isLoading.value = true;
    final result = await _signUpUseCase(reqDataEntity);
    _eitherRegisterFailureOrSuccess(result);
    _isLoading.value = false;
  }

  void _eitherRegisterFailureOrSuccess(
      Either<Failure, UserResEntity> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
      _userResEntity.value = value;
      UserReqEntity reqEntity = UserReqEntity();
      reqEntity.uid = value.uid;
      reqEntity.name = value.name;
      reqEntity.email = value.email;
      Get.find<UserController>()
          .createUserWithEmailAndPassword(userReqEntity: reqEntity);
      _buildAlertDialog(
        title: 'Message!',
        color: Colors.green,
        message: 'Successfully!',
      );
    });
  }

  resetPasswordWithEmail() async {
    UserReqEntity reqDataEntity = UserReqEntity();
    reqDataEntity.email = emailController.text;

    _isLoading.value = true;
    final result = await _resetPasswordUseCase(reqDataEntity);
    _eitherAuthFailureOrSuccess(result);
    _isLoading.value = false;
  }

  signOut() async {
    _isLoading.value = true;
    final result = await _signOutUseCase(NoParams());
    _eitherAuthFailureOrSuccess(result);
    _isLoading.value = false;
  }

  void _eitherAuthFailureOrSuccess(Either<Failure, void> failureOrSuccess) {
    return failureOrSuccess.fold((l) {
      return _buildAlertDialog(
        title: 'Warning !!!',
        color: Colors.red,
        message: l.toString(),
      );
    }, (value) {
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
