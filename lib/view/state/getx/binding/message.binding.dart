import '../../../../domain/usecase/messages/firebase/save_message_usecase.dart';

import '../../../../data/datasource/firebase/messages/message.firebase.datasource.dart';
import '../../../../data/service/messages/message.firebase.service.dart';
import '../../../../domain/usecase/messages/firebase/get_message_usecase.dart';

import '../controller/message.controller.dart';
import 'package:get/get.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MessageFirebaseDatasource>(MessageFirebaseDatasource());
    Get.lazyPut(() => MessageFirebaseService(
        firebaseDatasource: Get.find<MessageFirebaseDatasource>()));
    Get.lazyPut<MessageFirebaseService>(() => MessageFirebaseService(
        firebaseDatasource: Get.find<MessageFirebaseDatasource>()));
    Get.put<GetMessageFirebaseUseCase>(GetMessageFirebaseUseCase(
        firebase: Get.find<MessageFirebaseService>()));
    Get.put<SaveMessageFirebaseUseCase>(SaveMessageFirebaseUseCase(
        firebase: Get.find<MessageFirebaseService>()));
    Get.put<MessageController>(MessageController(
        getMessageFirebaseUseCase: Get.find<GetMessageFirebaseUseCase>(),
        saveMessageFirebaseUseCase: Get.find<SaveMessageFirebaseUseCase>()));
  }
}
