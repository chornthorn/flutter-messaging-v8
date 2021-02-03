import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entity/messages/message_req_entity.dart';
import '../../../../domain/usecase/messages/firebase/save_message_usecase.dart';
import '../../../../core/core.dart';
import '../../../../domain/entity/messages/message_res_entity.dart';
import '../../../../domain/usecase/messages/firebase/get_message_usecase.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final GetMessageFirebaseUseCase _getMessageFirebaseUseCase;
  final SaveMessageFirebaseUseCase _saveMessageFirebaseUseCase;

  MessageController({
    @required GetMessageFirebaseUseCase getMessageFirebaseUseCase,
    @required SaveMessageFirebaseUseCase saveMessageFirebaseUseCase,
  })  : assert(getMessageFirebaseUseCase != null),
        assert(saveMessageFirebaseUseCase != null),
        _getMessageFirebaseUseCase = getMessageFirebaseUseCase,
        _saveMessageFirebaseUseCase = saveMessageFirebaseUseCase;

  RxBool _isLoading = false.obs;

  bool get isLoading => this._isLoading.value;

  final _messageResEntity = <MessageResEntity>[].obs;

  List<MessageResEntity> get messageResEntity => this._messageResEntity.value;

  @override
  void onInit() {
    _getMessageList();
    super.onInit();
  }

  void _getMessageList() {
    this._isLoading.value = true;
    final result = _getMessageFirebaseUseCase(NoParams());
    this._messageResEntity.bindStream(result);
    this._isLoading.value = false;
  }

  saveMessageToFirebase(MessageReqDataEntity reqDataEntity)async{
    final result = await _saveMessageFirebaseUseCase(reqDataEntity);
    _eitherSaveMessageFailureOrSuccess(result);
  }

  void _eitherSaveMessageFailureOrSuccess(
      Either<Failure, void> failureOrSuccess) {
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
        message: 'Save successfully!',
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
